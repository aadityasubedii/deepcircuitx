assign interrupt      = next_interrupt != 3'd0 &&
                        next_interrupt != 3'd7 &&  
                        next_interrupt != 3'd6 &&  
                        !conflict               ;  