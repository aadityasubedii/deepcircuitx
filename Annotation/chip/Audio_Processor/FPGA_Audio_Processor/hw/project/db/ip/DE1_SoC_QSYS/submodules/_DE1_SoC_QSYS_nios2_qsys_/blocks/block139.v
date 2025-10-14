  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ienable_reg <= 0;
      else 
        W_ienable_reg <= W_ienable_reg_nxt;
    end