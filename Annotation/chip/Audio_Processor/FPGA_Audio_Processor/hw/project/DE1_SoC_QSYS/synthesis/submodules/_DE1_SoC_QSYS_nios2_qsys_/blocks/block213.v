  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_wr_dst_reg <= 0;
      else 
        R_wr_dst_reg <= D_wr_dst_reg;
    end