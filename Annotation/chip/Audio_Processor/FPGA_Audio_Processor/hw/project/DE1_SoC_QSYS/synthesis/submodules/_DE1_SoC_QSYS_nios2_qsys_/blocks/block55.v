  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_unsigned_lo_imm16 <= 0;
      else if (R_en)
          R_ctrl_unsigned_lo_imm16 <= R_ctrl_unsigned_lo_imm16_nxt;
    end