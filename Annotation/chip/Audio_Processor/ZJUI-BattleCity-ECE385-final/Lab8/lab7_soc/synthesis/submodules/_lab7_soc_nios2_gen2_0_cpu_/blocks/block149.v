  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_valid_from_M <= 0;
      else 
        A_valid_from_M <= E_valid & ~E_stall;
    end