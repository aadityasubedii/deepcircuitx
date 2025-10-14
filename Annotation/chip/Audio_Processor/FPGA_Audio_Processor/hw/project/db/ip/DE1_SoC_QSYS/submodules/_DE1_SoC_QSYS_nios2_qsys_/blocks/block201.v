  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_alu_sub <= 0;
      else 
        E_alu_sub <= D_ctrl_alu_subtract & R_valid;
    end