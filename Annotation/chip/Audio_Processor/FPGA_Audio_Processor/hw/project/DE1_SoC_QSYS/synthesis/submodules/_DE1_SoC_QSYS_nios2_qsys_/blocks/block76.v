  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_shift_logical <= 0;
      else if (R_en)
          R_ctrl_shift_logical <= R_ctrl_shift_logical_nxt;
    end