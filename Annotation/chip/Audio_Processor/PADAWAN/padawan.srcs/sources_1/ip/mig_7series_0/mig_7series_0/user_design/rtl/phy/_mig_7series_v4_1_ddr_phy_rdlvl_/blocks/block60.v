  generate
    genvar pt_i;
    if (nCK_PER_CLK == 4) begin: gen_pat_match_div4
      for (pt_i = 0; pt_i < DRAM_WIDTH; pt_i = pt_i + 1) begin: gen_pat_match

        