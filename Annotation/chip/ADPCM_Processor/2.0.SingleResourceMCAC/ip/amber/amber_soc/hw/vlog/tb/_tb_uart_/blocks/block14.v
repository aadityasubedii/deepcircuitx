always @( posedge clk_uart or negedge clk_uart_rst_n )
    if ( ~clk_uart_rst_n )
        begin
        rx_state            <= 'd0;
        rx_bit              <= 'd0;
        rx_byte             <= 'd0;
        rx_tap              <= 'd0;
        rx_start_negedge_d1 <= 'd0;
        end
    else                    
        begin
        rx_tap <= { rx_tap[2:0], i_uart_rxd };
        rx_start_negedge_d1 <= rx_start_negedge;
        
        if ( rx_bit_start )
            begin
            case ( rx_state ) 
        
                
                
                
                2'd0: if ( rx_start_negedge_d1 )
                        rx_state <= 2'd1;
                
                
                2'd1: if ( rx_bit == 3'd7 )
                        rx_state <= 2'd2;
                        
                
                2'd2: rx_state <= 2'd0;
                        
            endcase
        
            if ( rx_state == 2'd1 )
                begin
                rx_bit  <= rx_bit + 1'd1;
                
                rx_byte <= {i_uart_rxd, rx_byte[7:1]};
                end
                
            
            
            if ( rx_state == 2'd2 && rx_byte != 8'h0d && rx_byte != 8'h0c )
                $write("%c", rx_byte);
            end    
        end