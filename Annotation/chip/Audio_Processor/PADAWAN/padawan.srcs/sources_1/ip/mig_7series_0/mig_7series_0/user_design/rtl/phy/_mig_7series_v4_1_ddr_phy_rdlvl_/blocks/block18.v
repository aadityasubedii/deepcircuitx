  assign pb_detect_edge_setup
    = (cal1_state_r == CAL1_STORE_FIRST_WAIT) ||
      (cal1_state_r == CAL1_PB_STORE_FIRST_WAIT) ||
      (cal1_state_r == CAL1_PB_DEC_CPT_LEFT_WAIT);
