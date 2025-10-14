  always @(posedge clk)
    if (rst)
      ddr3_lm_done_r <= #TCQ 1'b0;
    else if ((init_state_r == INIT_LOAD_MR_WAIT) &&
            (chip_cnt_r == RANKS-1) && wrcal_done)
      ddr3_lm_done_r <= #TCQ 1'b1;
