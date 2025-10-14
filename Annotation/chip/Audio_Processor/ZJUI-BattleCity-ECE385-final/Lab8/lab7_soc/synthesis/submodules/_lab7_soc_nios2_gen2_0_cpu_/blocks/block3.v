  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_alu_force_and <= 0;
      else if (R_en)
          R_ctrl_alu_force_and <= R_ctrl_alu_force_and_nxt;
    end