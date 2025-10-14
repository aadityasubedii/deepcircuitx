  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_custom_multi <= 0;
      else if (R_en)
          R_ctrl_custom_multi <= R_ctrl_custom_multi_nxt;
    end