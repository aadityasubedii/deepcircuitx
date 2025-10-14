  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          control_register <= 0;
      else if (control_wr_strobe)
          control_register <= writedata[3 : 0];
    end