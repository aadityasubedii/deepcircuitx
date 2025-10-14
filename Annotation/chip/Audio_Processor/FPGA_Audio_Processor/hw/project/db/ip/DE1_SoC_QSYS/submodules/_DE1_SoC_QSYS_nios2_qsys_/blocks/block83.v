  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_retaddr <= 0;
      else if (R_en)
          R_ctrl_retaddr <= R_ctrl_retaddr_nxt;
    end