  generate
    if (nCK_PER_CLK == 4) begin: gen_div4_ca_tieoff
      always @(posedge clk) begin