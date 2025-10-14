    assign done = !busy;
    assign src_addr = (find_max ? address : 0) | (find_gain ? gain_addr : 0);