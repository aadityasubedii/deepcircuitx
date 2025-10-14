  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_valid_from_R <= 0;
      else 
        E_valid_from_R <= R_valid | E_stall;
    end