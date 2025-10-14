  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          period_h_register <= 2;
      else if (period_h_wr_strobe)
          period_h_register <= writedata;
    end