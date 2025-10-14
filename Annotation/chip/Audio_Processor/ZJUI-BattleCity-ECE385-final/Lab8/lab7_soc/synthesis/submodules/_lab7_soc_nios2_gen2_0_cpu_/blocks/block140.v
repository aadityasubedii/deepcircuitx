  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_cdsr_reg <= 0;
      else 
        W_cdsr_reg <= 0;
    end