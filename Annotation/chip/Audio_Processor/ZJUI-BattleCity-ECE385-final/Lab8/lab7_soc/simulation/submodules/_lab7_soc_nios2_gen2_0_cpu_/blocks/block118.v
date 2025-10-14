  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_crst <= 0;
      else if (R_en)
          R_ctrl_crst <= R_ctrl_crst_nxt;
    end