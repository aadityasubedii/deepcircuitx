  always @(posedge clk)
    if (rst)
      pi_phaselock_start <= #TCQ 1'b0;
    else if (init_state_r == INIT_PI_PHASELOCK_READS)
      pi_phaselock_start <= #TCQ 1'b1;
  