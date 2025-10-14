assign o_uart_int   = ( tx_interrupt & uart_cr_reg[5] )  |  
                      ( rx_interrupt & uart_cr_reg[4] )  ;  