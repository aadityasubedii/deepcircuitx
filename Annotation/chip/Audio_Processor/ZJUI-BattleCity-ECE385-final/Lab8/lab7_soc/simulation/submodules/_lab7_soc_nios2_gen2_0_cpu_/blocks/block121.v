  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_break <= 0;
      else if (R_en)
          R_ctrl_break <= R_ctrl_break_nxt;
    end