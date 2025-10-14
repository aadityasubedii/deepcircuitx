   always @(posedge clk) begin
      if (reset_n == 0)
        random <= $random(RANDOM_SEED);
      else
        random <= $random;
   end