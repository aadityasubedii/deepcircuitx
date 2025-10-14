assign write_state      = c_state == CS_IDLE || c_state == CS_WRITE_HIT ||  
                          c_state == CS_WRITE_HIT_WAIT_WB ||  c_state == CS_WRITE_MISS_WAIT_WB;
                          
assign write_stall      = (write_miss && !(i_wb_cached_ready && write_state)) || (write_hit && !i_wb_cached_ready);

assign read_stall       = request_hold && !idle_hit && !rbuf_hit && !wb_hit && !i_write_enable;

assign cache_busy_stall = c_state == CS_FILL_COMPLETE || c_state == CS_TURN_AROUND || c_state == CS_INIT ||
                          (fill_state && !rbuf_hit && !wb_hit) ||
                          (c_state == CS_WRITE_HIT && !consecutive_write);