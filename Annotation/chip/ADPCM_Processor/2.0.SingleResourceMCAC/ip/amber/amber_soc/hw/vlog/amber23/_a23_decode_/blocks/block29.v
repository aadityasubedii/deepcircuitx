assign next_interrupt = dabt_request     ? 3'd1 :  
                        firq_request     ? 3'd2 :  
                        irq_request      ? 3'd3 :  
                        instruction_adex ? 3'd4 :  
                        instruction_iabt ? 3'd5 :  
                                                   
                        und_request      ? 3'd6 :  
                        swi_request      ? 3'd7 :  
                                           3'd0 ;  