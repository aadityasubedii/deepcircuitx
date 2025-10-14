always @ (posedge clk_i)
  cmd_clk_en_r <= #TCQ  cmd_clk_en;