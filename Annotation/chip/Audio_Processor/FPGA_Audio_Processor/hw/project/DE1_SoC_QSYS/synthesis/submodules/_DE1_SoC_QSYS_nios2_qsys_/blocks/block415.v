  assign xbrk0_armed = (xbrk_ctrl0[4] & trigger_state_0) ||
    (xbrk_ctrl0[5] & trigger_state_1);