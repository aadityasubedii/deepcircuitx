assign raw_interrupts =  {23'd0,
                          i_ethmac_int,             

                          i_tm_timer_int[2],        
                          i_tm_timer_int[1],        
                          i_tm_timer_int[0],        
                          1'd0,

                          1'd0,
                          i_uart1_int,              
                          i_uart0_int,              
                          1'd0                      
                         };                         