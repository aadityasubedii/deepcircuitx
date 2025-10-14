  generate
    genvar rnk_i;
    for (rnk_i = 0; rnk_i < 4; rnk_i = rnk_i + 1) begin: gen_rnk
      always @(posedge clk) begin
        if (rst) begin