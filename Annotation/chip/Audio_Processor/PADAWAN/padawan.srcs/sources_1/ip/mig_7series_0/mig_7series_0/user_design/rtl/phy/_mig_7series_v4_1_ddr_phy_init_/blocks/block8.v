  generate
    genvar r,s;
    if ((DRAM_TYPE != "DDR3") || (CA_MIRROR != "ON")) begin: gen_no_mirror
      for (r = 0; r < nCK_PER_CLK; r = r + 1) begin: div_clk_loop
        always @(posedge clk) begin