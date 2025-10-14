      assign bank_wait_in_progress = sending_col || |rtp_timer_r ||
                                     (pre_wait_r && ~ras_timer_zero_r) ||
                                     op_wait_r;