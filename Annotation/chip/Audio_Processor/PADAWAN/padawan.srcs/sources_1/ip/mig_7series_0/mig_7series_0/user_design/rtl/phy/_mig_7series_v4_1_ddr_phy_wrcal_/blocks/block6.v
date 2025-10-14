  always @(posedge clk) begin
    if (rst)
      tap_inc_wait_cnt <= #TCQ 'd0;
    else if ((cal2_state_r == CAL2_DQ_IDEL_DEC) ||
             (cal2_state_r == CAL2_IFIFO_RESET) ||
             (cal2_state_r == CAL2_SANITY_WAIT))
      tap_inc_wait_cnt <= #TCQ tap_inc_wait_cnt + 1;
    else
      tap_inc_wait_cnt <= #TCQ 'd0;
  end