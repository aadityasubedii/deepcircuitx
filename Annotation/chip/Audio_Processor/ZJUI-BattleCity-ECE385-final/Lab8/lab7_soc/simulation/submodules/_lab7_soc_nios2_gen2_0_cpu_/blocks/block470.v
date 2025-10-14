  assign xbrk1_armed = (xbrk_ctrl1[4] & trigger_state_0) ||
    (xbrk_ctrl1[5] & trigger_state_1);