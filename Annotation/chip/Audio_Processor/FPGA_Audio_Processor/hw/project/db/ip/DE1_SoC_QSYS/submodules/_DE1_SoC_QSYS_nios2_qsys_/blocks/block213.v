  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_src2_use_imm <= 0;
      else 
        R_src2_use_imm <= D_ctrl_src2_choose_imm | (D_ctrl_br & R_valid);
    end