always@(posedge mtx_clk_i)
    begin
    case (rx_state_r)
        RX_IDLE:
            begin  
            rx_line_r  <= 'd0;       
            if (mrxdv_i)  
                begin
                rx_state_r   <= RX_PRE;
                end
            end
                       
        RX_PRE:
            begin
            if (mrxd_i == 4'hd)
                rx_state_r   <= RX_0;
            end
                               
        RX_0:  
            begin
            mrxd_r <= mrxd_i;
            
            if (mrxdv_i)
                rx_state_r     <= RX_1;
            else
                rx_state_r     <= RX_DONE;
            end
            
            
        RX_1:  
            begin
            rxm[rx_line_r]      <= {mrxd_i, mrxd_r};
            rx_line_r           <= rx_line_r + 1'd1;
            
            if (mrxdv_i)
                rx_state_r     <= RX_0;
            else
                rx_state_r     <= RX_DONE;
            end


        RX_DONE: 
            begin
            print_pkt(1'd0, 16'd0);  
            rx_state_r     <= RX_IDLE;
            
                
            pkt_from_amber_file     = $fopen(pkt_from_amber, "w");
            $fwrite(pkt_from_amber_file, "%02h\n", pkt_from_amber_num);
            
            for (x=0;x<rx_line_r;x=x+1)
                $fwrite(pkt_from_amber_file, "%02h\n", rxm[x]);
            $fclose(pkt_from_amber_file);
            
            
            if (pkt_from_amber_num == 8'd255)
                pkt_from_amber_num  <= 8'd1; 
            else
                pkt_from_amber_num  <=  pkt_from_amber_num + 1'd1; 
            end
            
            
    endcase