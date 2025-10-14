  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_src2_choose_imm <= 0;
      else if (R_en)
          R_ctrl_src2_choose_imm <= R_ctrl_src2_choose_imm_nxt;
    end