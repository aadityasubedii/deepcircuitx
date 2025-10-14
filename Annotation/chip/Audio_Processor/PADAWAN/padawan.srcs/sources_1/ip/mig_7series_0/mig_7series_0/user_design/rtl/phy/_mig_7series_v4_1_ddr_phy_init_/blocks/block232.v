  always @(posedge clk)
    if (rst)
      wrcal_rd_wait <= #TCQ 1'b0;
    else if (init_state_r == INIT_WRCAL_READ_WAIT)
      wrcal_rd_wait <= #TCQ 1'b1;
    else
      wrcal_rd_wait <= #TCQ 1'b0;