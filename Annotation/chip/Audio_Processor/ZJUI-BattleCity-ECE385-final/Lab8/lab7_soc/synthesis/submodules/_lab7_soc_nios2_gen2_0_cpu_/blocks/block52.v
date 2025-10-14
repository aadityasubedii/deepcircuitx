  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ld_signed <= 0;
      else if (R_en)
          R_ctrl_ld_signed <= R_ctrl_ld_signed_nxt;
    end