assign consecutive_write = miss_address[31:4] == i_address[31:4] && 
                           i_write_enable && 
                           c_state == CS_WRITE_HIT && 
                           request_pulse;