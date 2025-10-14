  generate
    genvar mux_i;
    for (mux_i = 0; mux_i < DRAM_WIDTH; mux_i = mux_i + 1) begin: gen_mux_rd