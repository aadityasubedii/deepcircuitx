  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_logic_op <= 0;
      else 
        R_logic_op <= D_logic_op;
    end