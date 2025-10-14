  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_custom <= 0;
      else if (R_en)
          R_ctrl_custom <= R_ctrl_custom_nxt;
    end