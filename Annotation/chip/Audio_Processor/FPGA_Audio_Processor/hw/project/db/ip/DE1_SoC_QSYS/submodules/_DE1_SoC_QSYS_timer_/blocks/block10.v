  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          period_l_register <= 11927;
      else if (period_l_wr_strobe)
          period_l_register <= writedata;
    end