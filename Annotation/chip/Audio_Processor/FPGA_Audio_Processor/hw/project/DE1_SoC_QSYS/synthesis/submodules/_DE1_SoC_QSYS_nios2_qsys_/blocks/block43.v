  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_alu_signed_comparison <= 0;
      else if (R_en)
          R_ctrl_alu_signed_comparison <= R_ctrl_alu_signed_comparison_nxt;
    end