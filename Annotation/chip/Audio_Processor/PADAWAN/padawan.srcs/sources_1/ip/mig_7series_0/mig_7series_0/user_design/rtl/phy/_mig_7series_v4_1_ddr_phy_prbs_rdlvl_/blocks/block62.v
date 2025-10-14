  generate
    genvar muxr2_i;
    if (nCK_PER_CLK == 4) begin: gen_mux_div4
        for (muxr2_i = 0; muxr2_i < DRAM_WIDTH; muxr2_i = muxr2_i + 1) begin: gen_rd_4