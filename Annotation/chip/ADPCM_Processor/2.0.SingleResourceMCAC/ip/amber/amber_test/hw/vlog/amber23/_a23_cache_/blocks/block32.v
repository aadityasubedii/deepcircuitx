assign cache_busy_stall = ((c_state == CS_TURN_AROUND || c_state == CS_FILL1) && enable) ||
                           c_state == CS_INIT;