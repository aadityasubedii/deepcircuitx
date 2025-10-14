
assign cache_busy_stall = (c_state == CS_TURN_AROUND  && enable && !read_buf_hit) || c_state == CS_INIT;