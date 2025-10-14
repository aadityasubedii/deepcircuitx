  assign pb_detect_edge
    = (cal1_state_r == CAL1_PAT_DETECT) ||
      (cal1_state_r == CAL1_DETECT_EDGE) ||
      (cal1_state_r == CAL1_PB_DETECT_EDGE) ||
      (cal1_state_r == CAL1_PB_DETECT_EDGE_DQ);
