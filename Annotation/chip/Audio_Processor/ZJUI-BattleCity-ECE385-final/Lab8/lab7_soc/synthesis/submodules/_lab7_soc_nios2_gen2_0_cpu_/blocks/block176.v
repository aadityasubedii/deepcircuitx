  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_src1 <= 0;
      else 
        E_src1 <= R_src1;
    end