always@(posedge mtx_clk_i)
    begin
    case (state_r)
        IDLE:
            begin
            mtxd_o    <= 'd0;
            mtxdv_o   <= 'd0;
            mtxerr_o  <= 'd0;
            wcount_r  <= 'd0;
            
            if (md_bmcr_r[9])  
                begin
                wcount_r  <= wcount_r + 1'd1;
                if (wcount_r == 32'd10000)
                    begin
                    state_r   <= POLL;
                    wcount_r  <= 'd0;
                    $display("Start polling for packets to send to amber");
                    end
                end
            end

        
        
        WAIT:
            begin
            wcount_r <= wcount_r + 1'd1;
            if (wcount_r == 32'd100)
                begin
                wcount_r <= 'd0;
                state_r  <= POLL;
                end
            end

        
        POLL: 
            begin
            mtxd_o    <= 'd0;
            mtxdv_o   <= 'd0;
            mtxerr_o  <= 'd0;
            
            
            pkt_to_amber_file               = $fopen(pkt_to_amber, "r");            
            fgets_return                    = $fgets(line, pkt_to_amber_file);
            pkt_to_amber_address = 0;
            while (fgets_return)
                begin
                pkt_to_amber_data           = hex_chars_to_8bits (line[23:8]);
                mem[pkt_to_amber_address]   = pkt_to_amber_data[7:0];
                pkt_to_amber_address        = pkt_to_amber_address + 1;
                fgets_return                = $fgets(line, pkt_to_amber_file);                
                end
            $fclose(pkt_to_amber_file);

            
            if (mem[0] != last_pkt_num_r) 
                begin
                state_r         <= PREA;
                pkt_len_r       <= {mem[1], mem[2]} + 16'd14;
                last_pkt_num_r  <= mem[0];
                line_r          <= 'd0;
                pkt_pos_r       <= 'd0;
                pcount_r        <= 'd0;
                wcount_r        <= 'd0;
    
                pkt_to_amber_ack_file = $fopen(pkt_to_amber_ack, "w");
                $fwrite(pkt_to_amber_ack_file, "%d\n", mem[0]);
                $fclose(pkt_to_amber_ack_file);
                end
            else begin
                state_r   <= WAIT;
                end
                
            end
                        
        
        
        PREA: 
            begin
            mtxd_o    <= 4'b0101;
            mtxdv_o   <= 1'd1;
            pcount_r  <= pcount_r + 1'd1;
            if (pcount_r == 4'd6)
                begin
                pcount_r  <= 'd0;
                state_r   <= PREB;            
                end
            end
            
            
        PREB:
            begin
            mtxd_o    <= 4'b1101;
            mtxdv_o   <= 1'd1;
            state_r   <= TX_0;
            
            print_pkt(1'd1, line_r);  
            end 
            
                           
        TX_0:  
            begin
            mtxd_o    <= mem[line_r+3][3:0];
            mtxdv_o   <= 1'd1;
            state_r   <= TX_1;
            end
            
            
        TX_1:  
            begin
            mtxd_o    <= mem[line_r+3][7:4];
            mtxdv_o   <= 1'd1;
            line_r    <= line_r + 1'd1;
            
            if (pkt_pos_r + 1'd1 == pkt_len_r)
                state_r     <= CRC0;
            else
                begin
                state_r     <= TX_0;
                pkt_pos_r   <= pkt_pos_r + 1'd1;
                end
            end

                        
        CRC0:
            begin
            mtxd_o    <= {~crc[28], ~crc[29], ~crc[30], ~crc[31]};
            mtxdv_o   <= 1'd1;
            state_r   <= POLL;
            end
            
    endcase
    end