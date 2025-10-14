  assign xbrk2_armed = (xbrk_ctrl2[4] & trigger_state_0) ||
    (xbrk_ctrl2[5] & trigger_state_1);