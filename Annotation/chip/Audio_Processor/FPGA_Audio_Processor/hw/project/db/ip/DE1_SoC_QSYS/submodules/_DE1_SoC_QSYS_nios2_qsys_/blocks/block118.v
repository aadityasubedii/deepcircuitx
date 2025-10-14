  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_write <= 0;
      else 
        d_write <= d_write_nxt;
    end