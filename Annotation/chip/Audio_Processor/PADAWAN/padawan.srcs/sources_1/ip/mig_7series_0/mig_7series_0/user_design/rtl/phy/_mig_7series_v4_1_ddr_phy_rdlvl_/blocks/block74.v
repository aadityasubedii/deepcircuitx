  generate
    genvar rd_i;
    if (nCK_PER_CLK == 4) begin: gen_sr_div4
      if (RD_SHIFT_LEN == 1) begin: gen_sr_len_eq1
        for (rd_i = 0; rd_i < DRAM_WIDTH; rd_i = rd_i + 1) begin: gen_sr