  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ipending_reg <= 0;
      else 
        W_ipending_reg <= W_ipending_reg_nxt;
    end