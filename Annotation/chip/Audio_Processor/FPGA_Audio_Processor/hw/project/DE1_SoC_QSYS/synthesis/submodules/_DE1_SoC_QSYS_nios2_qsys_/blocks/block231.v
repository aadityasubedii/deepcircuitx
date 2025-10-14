  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i_read <= 1'b1;
      else 
        i_read <= i_read_nxt;
    end