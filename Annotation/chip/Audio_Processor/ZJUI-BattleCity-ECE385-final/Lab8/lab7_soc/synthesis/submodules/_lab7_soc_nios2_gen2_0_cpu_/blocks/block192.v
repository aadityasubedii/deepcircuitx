  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_dst_regnum <= 0;
      else 
        R_dst_regnum <= D_dst_regnum;
    end