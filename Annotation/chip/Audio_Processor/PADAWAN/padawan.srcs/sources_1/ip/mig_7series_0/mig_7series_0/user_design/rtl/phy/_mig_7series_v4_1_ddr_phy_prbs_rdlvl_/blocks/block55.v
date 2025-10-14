  always @(posedge clk)
    if (rst)
      samples_cnt2_en_r <= #TCQ 1'b0;
    else begin 
      if ((prbs_state_r == PRBS_IDLE) || 
          (prbs_state_r == PRBS_DEC_DQS) ||
          (prbs_state_r == PRBS_INC_DQS) ||
          (prbs_state_r == FINE_PI_INC) ||
          (prbs_state_r == PRBS_NEW_DQS_PREWAIT))
        samples_cnt2_en_r <= #TCQ 1'b0;
      else if ((samples_cnt_r == NUM_SAMPLES_CNT1) && rd_valid_r1 && samples_cnt1_en_r)
        samples_cnt2_en_r <= #TCQ 1'b1;
    end