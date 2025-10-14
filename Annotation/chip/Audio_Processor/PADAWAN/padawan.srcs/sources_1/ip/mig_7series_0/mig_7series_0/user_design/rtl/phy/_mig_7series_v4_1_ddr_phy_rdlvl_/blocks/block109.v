  generate
    genvar mux_i;
    for (mux_i = 0; mux_i < DRAM_WIDTH; mux_i = mux_i + 1) begin: gen_mux_rd
      always @(posedge clk) begin
        mux_rd_rise0_r[mux_i] <= #TCQ rd_data_rise0[DRAM_WIDTH*rd_mux_sel_r +
                                                    mux_i];