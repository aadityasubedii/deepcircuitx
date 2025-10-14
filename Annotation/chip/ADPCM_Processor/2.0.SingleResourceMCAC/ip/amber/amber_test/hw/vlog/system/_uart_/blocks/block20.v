always @( posedge i_clk )
    if ( tx_bit_pulse )
    
        case ( txd_state )
        
            TXD_IDLE :
                begin
                txd       <= 1'd1;
                
                if ( uart0_cts_n_d[3:1] == 3'b000 && !tx_fifo_empty )
                    txd_state <= TXD_START;
                end
                
            TXD_START :
                begin
                txd       <= 1'd0;
                txd_state <= TXD_DATA0;
                end
                
            TXD_DATA0 :
                begin
                txd       <= tx_byte[0];
                txd_state <= TXD_DATA1;
                end
                
            TXD_DATA1 :
                begin
                txd       <= tx_byte[1];
                txd_state <= TXD_DATA2;
                end
                
            TXD_DATA2 :
                begin
                txd       <= tx_byte[2];
                txd_state <= TXD_DATA3;
                end
                
            TXD_DATA3 :
                begin
                txd       <= tx_byte[3];
                txd_state <= TXD_DATA4;
                end
                
            TXD_DATA4 :
                begin
                txd       <= tx_byte[4];
                txd_state <= TXD_DATA5;
                end
                
            TXD_DATA5 :
                begin
                txd       <= tx_byte[5];
                txd_state <= TXD_DATA6;
                end
                
            TXD_DATA6 :
                begin
                txd       <= tx_byte[6];
                txd_state <= TXD_DATA7;
                end
                
            TXD_DATA7 :
                begin
                txd       <= tx_byte[7];
                txd_state <= TXD_STOP1;
                end
                
            TXD_STOP1 :
                begin
                txd       <= 1'd1;
                txd_state <= TXD_STOP2;
                end

            TXD_STOP2 :
                begin
                txd       <= 1'd1;
                txd_state <= TXD_STOP3;
                end
                
            TXD_STOP3 :
                begin
                txd       <= 1'd1;
                txd_state <= TXD_IDLE;
                end
                
            default :
                begin
                txd       <= 1'd1;
                end
                
        endcase