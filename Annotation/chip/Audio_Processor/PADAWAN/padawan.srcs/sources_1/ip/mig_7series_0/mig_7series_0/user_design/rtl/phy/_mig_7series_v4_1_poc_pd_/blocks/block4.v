    always @(posedge clk) begin
      rising_clk_seen = 1'b1;
      if (rising_clk_seen) q1_delayed <= q1;
    end