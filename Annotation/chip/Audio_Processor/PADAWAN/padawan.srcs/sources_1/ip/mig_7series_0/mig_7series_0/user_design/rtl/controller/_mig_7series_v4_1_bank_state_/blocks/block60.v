      assign bank_wait_in_progress = sending_col_not_rmw_rd || |rtp_timer_r ||
                                     (pre_wait_r && ~ras_timer_zero_r);