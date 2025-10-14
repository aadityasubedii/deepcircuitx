  always @(posedge clk)
    if (rst)
      pi_calib_rank_done_r <= #TCQ 1'b0;
    else if (pi_phase_locked_all_r3 && ~pi_phase_locked_all_r4)
      pi_calib_rank_done_r <= #TCQ 1'b1;
    else
      pi_calib_rank_done_r <= #TCQ 1'b0;
