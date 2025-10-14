  always @(posedge clk)
    cnt_wrcal_rd <= #TCQ (cnt_wait == 'd4);
  