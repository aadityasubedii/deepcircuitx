  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_valid <= 0;
      else 
        D_valid <= F_valid;
    end