    always @(posedge clk)
      if (rst)
        num_samples_done_r <= #TCQ 1'b0;
      else if ((prbs_state_r == PRBS_DEC_DQS) ||
            (prbs_state_r == PRBS_INC_DQS)||
            (prbs_state_r == FINE_PI_INC) ||
            (prbs_state_r == FINE_PI_DEC))
        num_samples_done_r <= #TCQ 'b0;
      else if (samples_cnt_r == NUM_SAMPLES_CNT)
        num_samples_done_r <= #TCQ 1'b1;
  end else begin: victim_not_fixed