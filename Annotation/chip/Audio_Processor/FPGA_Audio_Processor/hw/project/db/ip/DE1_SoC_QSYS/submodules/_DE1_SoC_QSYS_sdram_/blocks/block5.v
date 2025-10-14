  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          za_data <= 0;
      else 
        za_data <= zs_dq;
    end