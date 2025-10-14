  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_alu_subtract <= 0;
      else if (R_en)
          R_ctrl_alu_subtract <= R_ctrl_alu_subtract_nxt;
    end