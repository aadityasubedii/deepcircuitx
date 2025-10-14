assign write_hit        = enable &&  i_write_enable && hit;
                                                           
assign write_miss       = enable &&  i_write_enable && !hit && c_state != CS_WRITE_HIT1;