  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          za_valid <= 0;
      else if (1)
          za_valid <= rd_valid[2];
    end