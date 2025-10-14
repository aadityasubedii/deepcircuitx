      for (r = 0; r < nCK_PER_CLK; r = r + 1) begin: gen_ba_div_clk_loop        
        for (s = 0; s < BANK_WIDTH; s = s + 1) begin: gen_ba
          