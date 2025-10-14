  assign xbrk3_armed = (xbrk_ctrl3[4] & trigger_state_0) ||
    (xbrk_ctrl3[5] & trigger_state_1);