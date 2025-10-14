  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_signed_imm12 <= 0;
      else if (R_en)
          R_ctrl_signed_imm12 <= R_ctrl_signed_imm12_nxt;
    end