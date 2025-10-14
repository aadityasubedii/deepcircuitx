  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_iw <= 0;
      else if (F_valid)
          D_iw <= F_iw;
    end