  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          za_data <= 0;
      else if (1)
          za_data <= zs_dq;
    end