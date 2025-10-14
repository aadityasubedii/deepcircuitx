  always @(posedge clk) begin
    if (rst)
      not_empty_wait_cnt <= #TCQ 'd0;
    else if ((cal2_state_r == CAL2_READ_WAIT) && wrcal_rd_wait)
      not_empty_wait_cnt <= #TCQ not_empty_wait_cnt + 1;
    else
      not_empty_wait_cnt <= #TCQ 'd0;
  end