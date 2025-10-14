  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_set_src2_rem_imm <= 0;
      else if (R_en)
          R_ctrl_set_src2_rem_imm <= R_ctrl_set_src2_rem_imm_nxt;
    end