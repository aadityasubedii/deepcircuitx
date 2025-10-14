  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_src2 <= 0;
      else 
        E_src2 <= R_src2;
    end