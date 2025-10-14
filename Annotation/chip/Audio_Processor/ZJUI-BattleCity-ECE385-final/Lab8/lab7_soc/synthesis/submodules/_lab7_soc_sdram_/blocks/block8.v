  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          rd_valid <= {3{1'b0}};
      else 
        rd_valid <= (rd_valid << 1) | { {2{1'b0}}, rd_strobe };
    end