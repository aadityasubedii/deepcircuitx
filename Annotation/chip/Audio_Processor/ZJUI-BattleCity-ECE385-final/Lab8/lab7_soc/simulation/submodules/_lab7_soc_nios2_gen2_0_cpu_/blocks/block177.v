  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_valid <= 0;
      else 
        W_valid <= E_valid & ~E_stall;
    end