  generate
    if (nCK_PER_CLK == 4) begin: gen_old_sr_div4
    for (z = 0; z < DRAM_WIDTH; z = z + 1) begin: gen_old_sr
      always @(posedge clk) begin
        if (sr_valid_r || mpr_valid_r) begin
          