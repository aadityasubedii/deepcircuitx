assign interrupt_mode = next_interrupt == 3'd2 ? FIRQ :
                        next_interrupt == 3'd3 ? IRQ  :
                        next_interrupt == 3'd4 ? SVC  :
                        next_interrupt == 3'd5 ? SVC  :
                        next_interrupt == 3'd6 ? SVC  :
                        next_interrupt == 3'd7 ? SVC  :
                        next_interrupt == 3'd1 ? SVC  :
                                                 USR  ;