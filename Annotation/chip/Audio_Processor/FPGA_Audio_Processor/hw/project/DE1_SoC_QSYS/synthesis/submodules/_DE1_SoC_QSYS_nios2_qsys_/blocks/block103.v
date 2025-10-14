  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_jmp_indirect <= 0;
      else if (R_en)
          R_ctrl_jmp_indirect <= R_ctrl_jmp_indirect_nxt;
    end