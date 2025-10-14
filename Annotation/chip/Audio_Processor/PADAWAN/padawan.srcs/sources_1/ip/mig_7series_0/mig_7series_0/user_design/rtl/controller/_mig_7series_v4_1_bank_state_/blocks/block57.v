    else begin : op_mode_enabled
      reg op_wait_r;
      assign bank_wait_in_progress = sending_col || |rtp_timer_r ||
                                     (pre_wait_r && ~ras_timer_zero_r) ||
                                     op_wait_r;
      wire op_active = ~rst && ~passing_open_bank && ((end_rtp_lcl && tail_r)
                                || op_wait_r);