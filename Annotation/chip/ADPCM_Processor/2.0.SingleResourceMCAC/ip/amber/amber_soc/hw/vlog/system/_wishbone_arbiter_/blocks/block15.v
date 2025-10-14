assign current_slave = in_ethmac   ( master_adr ) ? 4'd0  :  
                       in_boot_mem ( master_adr ) ? 4'd1  :  
                       in_main_mem ( master_adr ) ? 4'd2  :  
                       in_uart0    ( master_adr ) ? 4'd3  :  
                       in_uart1    ( master_adr ) ? 4'd4  :  
                       in_test     ( master_adr ) ? 4'd5  :  
                       in_tm       ( master_adr ) ? 4'd6  :  
                       in_ic       ( master_adr ) ? 4'd7  :  
                                                    4'd2  ;  