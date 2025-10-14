  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_shift_right_arith <= 0;
      else if (R_en)
          R_ctrl_shift_right_arith <= R_ctrl_shift_right_arith_nxt;
    end