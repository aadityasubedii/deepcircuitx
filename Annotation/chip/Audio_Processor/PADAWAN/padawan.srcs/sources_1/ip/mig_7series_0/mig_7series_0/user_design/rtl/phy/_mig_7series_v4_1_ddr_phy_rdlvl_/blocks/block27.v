  generate
    if (nCK_PER_CLK == 4) begin: gen_sr_match_div4
    for (z = 0; z < DRAM_WIDTH; z = z + 1) begin: gen_sr_match
      always @(posedge clk) begin