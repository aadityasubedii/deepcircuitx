  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_read <= 0;
      else 
        d_read <= d_read_nxt;
    end