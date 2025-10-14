  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_alu_force_xor <= 0;
      else if (R_en)
          R_ctrl_alu_force_xor <= R_ctrl_alu_force_xor_nxt;
    end