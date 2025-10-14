  always @(posedge clk)
    if (rst)
      pi_calib_done_r <= #TCQ 1'b0;
    else if (pi_calib_rank_done_r)
      pi_calib_done_r <= #TCQ 1'b1;
      