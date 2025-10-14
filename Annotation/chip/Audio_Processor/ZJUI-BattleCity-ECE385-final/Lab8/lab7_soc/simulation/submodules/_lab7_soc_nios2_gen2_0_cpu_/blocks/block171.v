  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_estatus_reg <= 0;
      else 
        W_estatus_reg <= W_estatus_reg_nxt;
    end