  always @(posedge clk) begin
    if (rst || (temp_wrcal_done && ~temp_wrcal_done_r) ||
       (init_state_r == INIT_PRECHARGE_PREWAIT))
      tg_timer <= #TCQ 'd0;
    else if ((pi_phaselock_timer == PHASELOCKED_TIMEOUT) &&
            tg_timer_go &&
            (tg_timer != TG_TIMER_TIMEOUT))
      tg_timer <= #TCQ tg_timer + 1;
  end