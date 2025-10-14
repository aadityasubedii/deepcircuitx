    assign EOW_LEFT = MASK & (1 + BITS);
    assign EOW_RIGHT = MASK & (1 + BITS + midpoint);
    assign frame = frame_posn & MASK;