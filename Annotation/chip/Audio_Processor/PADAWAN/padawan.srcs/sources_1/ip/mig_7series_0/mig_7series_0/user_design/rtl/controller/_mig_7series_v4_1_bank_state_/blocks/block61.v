  generate
    if (nOP_WAIT == 0) begin : op_mode_disabled
      assign bank_wait_in_progress = sending_col_not_rmw_rd || |rtp_timer_r ||
                                     (pre_wait_r && ~ras_timer_zero_r);
      assign start_pre_wait = end_rtp_lcl;
      assign op_exit_req = 1'b0;
    end