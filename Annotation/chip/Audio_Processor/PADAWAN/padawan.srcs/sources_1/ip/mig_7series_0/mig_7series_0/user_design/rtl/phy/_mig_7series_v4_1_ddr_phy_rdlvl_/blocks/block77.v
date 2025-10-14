  always @(posedge clk)
    if ((cal1_state_r == CAL1_NEW_DQS_WAIT) ||
        (cal1_state_r == CAL1_MPR_NEW_DQS_WAIT) ||
        (cal1_state_r == CAL1_NEW_DQS_PREWAIT) ||
        (cal1_state_r == CAL1_VALID_WAIT) ||
        (cal1_state_r == CAL1_PB_STORE_FIRST_WAIT) ||
        (cal1_state_r == CAL1_PB_INC_CPT_WAIT) ||
        (cal1_state_r == CAL1_PB_DEC_CPT_LEFT_WAIT) ||
        (cal1_state_r == CAL1_PB_INC_DQ_WAIT) ||
        (cal1_state_r == CAL1_PB_DEC_CPT_WAIT) ||
        (cal1_state_r == CAL1_IDEL_INC_CPT_WAIT) ||
        (cal1_state_r == CAL1_IDEL_DEC_CPT_WAIT) ||
        (cal1_state_r == CAL1_STORE_FIRST_WAIT) ||
        (cal1_state_r == CAL1_DQ_IDEL_TAP_INC_WAIT) ||
        (cal1_state_r == CAL1_DQ_IDEL_TAP_DEC_WAIT) ||
        (cal1_state_r == CAL1_CENTER_WAIT) ||
        (cal1_state_r == CAL1_RD_STOP_FOR_PI_INC))
      cal1_wait_cnt_en_r <= #TCQ 1'b1;
    else
      cal1_wait_cnt_en_r <= #TCQ 1'b0;