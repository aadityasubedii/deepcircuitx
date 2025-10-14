  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_exception <= 0;
      else if (R_en)
          R_ctrl_exception <= R_ctrl_exception_nxt;
    end