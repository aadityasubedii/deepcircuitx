  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_src_imm5_shift_rot <= 0;
      else if (R_en)
          R_ctrl_src_imm5_shift_rot <= R_ctrl_src_imm5_shift_rot_nxt;
    end