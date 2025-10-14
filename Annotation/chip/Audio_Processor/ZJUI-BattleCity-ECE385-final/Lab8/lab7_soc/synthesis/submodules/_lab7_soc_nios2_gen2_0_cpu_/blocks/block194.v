  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_valid <= 0;
      else 
        R_valid <= D_valid;
    end