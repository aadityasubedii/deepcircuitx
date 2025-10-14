  always @ (posedge clk)
    if (prbs_state_r == PRBS_PAT_COMPARE)
      compare_err_latch <= #TCQ compare_err? 1'b1: compare_err_latch;
    else 
      compare_err_latch <= #TCQ 1'b0;