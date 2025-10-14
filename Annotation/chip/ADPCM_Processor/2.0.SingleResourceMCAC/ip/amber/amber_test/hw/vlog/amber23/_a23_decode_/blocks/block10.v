assign instruction_valid = (control_state == EXECUTE || control_state == PRE_FETCH_EXEC) ||
                     
                     
                    (!instruction_execute && (control_state == PC_STALL1    ||
                                              control_state == MEM_WAIT1    ||
                                              control_state == COPRO_WAIT   ||
                                              control_state == SWAP_WRITE   ||
                                              control_state == MULT_PROC1   ||
                                              control_state == MTRANS_EXEC1 ||
                                              control_state == MTRANS_EXEC3 ||
                                              control_state == MTRANS_EXEC3B  ) );