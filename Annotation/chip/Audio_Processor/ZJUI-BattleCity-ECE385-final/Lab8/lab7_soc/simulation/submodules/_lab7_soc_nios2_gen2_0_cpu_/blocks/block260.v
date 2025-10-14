  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_compare_op <= 0;
      else 
        R_compare_op <= D_compare_op;
    end