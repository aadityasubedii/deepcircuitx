    
assign data_wdata       = write_hit && c_state == CS_IDLE ? write_hit_wdata : 
                          consecutive_write               ? consecutive_write_wdata :
                                                            read_miss_wdata ;