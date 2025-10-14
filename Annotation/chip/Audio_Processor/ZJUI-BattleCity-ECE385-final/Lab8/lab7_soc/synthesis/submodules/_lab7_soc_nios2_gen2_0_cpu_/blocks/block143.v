  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_bstatus_reg <= 0;
      else 
        W_bstatus_reg <= W_bstatus_reg_nxt;
    end