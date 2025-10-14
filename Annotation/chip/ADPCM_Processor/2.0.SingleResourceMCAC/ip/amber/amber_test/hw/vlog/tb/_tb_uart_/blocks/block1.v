always @( posedge clk_uart or negedge clk_uart_rst_n )
    if ( ~clk_uart_rst_n )
        begin
        tx_state            <= 'd0;
        tx_bit              <= 'd0;
        tx_byte             <= 'd0;
        o_uart_txd          <= 1'd1;
        txfifo_rp           <= 'd0;
        end
    else                    
        begin
        if ( tx_bit_start )
            begin
            case ( tx_state ) 
        
                
                2'd0: if ( tx_start && !txfifo_empty && !i_uart_cts_n )
                        begin
                        tx_state    <= 2'd1;
                        tx_byte     <= tx_fifo[txfifo_rp[3:0]];
                        txfifo_rp   <= txfifo_rp + 1'd1;
                        
                        o_uart_txd  <= 1'd0;
                        end
                        
                
                2'd1: if ( !i_uart_cts_n )   
                        begin
                        if ( tx_bit == 3'd7 )
                            tx_state <= 2'd2;
                        tx_bit      <= tx_bit + 1'd1;
                        tx_byte     <= {1'd0, tx_byte[7:1]};
                        
                        o_uart_txd  <= tx_byte[0];
                        end
                        
                
                2'd2:   begin
                        tx_state    <= 2'd0;
                        o_uart_txd  <= 1'd1;
                        end
            endcase
            end    
        end


endmodule