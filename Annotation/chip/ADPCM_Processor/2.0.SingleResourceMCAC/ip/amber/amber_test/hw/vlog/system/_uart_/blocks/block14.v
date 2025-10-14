always @( posedge i_clk )
    case ( rxd_state )
    
        RXD_IDLE :
            if ( rx_fifo_full )
                rxen                    <= 1'd0;
            else
                begin
                rxd_state               <= RXD_START;
                rxen                    <= 1'd1;
                restart_rx_bit_count    <= 1'd1;
                rx_byte                 <= 'd0;
                end
            
        RXD_START : 
            
            if ( rx_start ) 
                begin
                rxd_state               <= RXD_START_MID1;
                restart_rx_bit_count    <= 1'd1;
                end
            else    
                restart_rx_bit_count    <= 1'd0;

        
        
        
        RXD_START_MID1 :
            rxd_state               <= RXD_START_MID;
            
        RXD_START_MID :
            if ( rx_bit_pulse_count == RX_HALFPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA0;
                restart_rx_bit_count    <= 1'd1;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA0 :
            if ( rx_bit_pulse_count == RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA1;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[0]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA1 :
            if ( rx_bit_pulse_count == RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA2;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[1]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA2 :
            if ( rx_bit_pulse_count == RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA3;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[2]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA3 :
            if ( rx_bit_pulse_count == RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA4;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[3]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA4 :
            if ( rx_bit_pulse_count ==  RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA5;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[4]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA5 :
            if ( rx_bit_pulse_count ==  RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA6;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[5]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA6 :
            if ( rx_bit_pulse_count ==  RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_DATA7;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[6]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_DATA7 :
            if ( rx_bit_pulse_count ==  RX_BITPULSE_COUNT )
                begin
                rxd_state               <= RXD_STOP;
                restart_rx_bit_count    <= 1'd1;
                rx_byte[7]              <= i_uart_rxd;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        RXD_STOP :
            if ( rx_bit_pulse_count ==  RX_BITPULSE_COUNT )  
                begin
                rxd_state               <= RXD_IDLE;
                restart_rx_bit_count    <= 1'd1;
                end
            else    
                restart_rx_bit_count    <= 1'd0;
            
        default :
            begin
            rxd_state       <= RXD_IDLE;
            end
            
    endcase
