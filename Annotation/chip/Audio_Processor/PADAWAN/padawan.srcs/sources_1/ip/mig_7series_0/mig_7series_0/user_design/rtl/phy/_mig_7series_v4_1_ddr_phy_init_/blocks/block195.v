  always @(posedge clk)
    wrlvl_final_r <= #TCQ wrlvl_final;
  