  always @(posedge clk) begin
    if (rst || ((PRE_REV3ES == "ON") && temp_wrcal_done && ~temp_wrcal_done_r))
      pi_phaselock_timer <= #TCQ 'd0;
    else if (((init_state_r == INIT_PI_PHASELOCK_READS) &&
             (pi_phaselock_timer != PHASELOCKED_TIMEOUT)) ||
             tg_timer_go)
      pi_phaselock_timer <= #TCQ pi_phaselock_timer + 1;
    else
      pi_phaselock_timer <= #TCQ pi_phaselock_timer;
  end