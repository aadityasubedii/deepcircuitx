  always @(posedge clk)
    if ((prbs_state_r == PRBS_NEW_DQS_WAIT) ||
        (prbs_state_r == PRBS_INC_DQS_WAIT) ||
        (prbs_state_r == PRBS_DEC_DQS_WAIT) ||
        (prbs_state_r == FINE_PI_DEC_WAIT)  ||
        (prbs_state_r == FINE_PI_INC_WAIT)  ||
        (prbs_state_r == PRBS_NEW_DQS_PREWAIT))
      wait_state_cnt_en_r <= #TCQ 1'b1;
    else
      wait_state_cnt_en_r <= #TCQ 1'b0;