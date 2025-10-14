assign write_stall      = ( write_hit  && c_state != CS_WRITE_HIT1 ) ||
                          ( write_miss && ( c_state != CS_IDLE ) )   ||
                           i_wb_stall                                ;