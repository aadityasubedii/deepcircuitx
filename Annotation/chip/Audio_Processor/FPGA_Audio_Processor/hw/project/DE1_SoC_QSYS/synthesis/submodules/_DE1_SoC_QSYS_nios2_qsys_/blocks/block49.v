  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_br <= 0;
      else if (R_en)
          R_ctrl_br <= R_ctrl_br_nxt;
    end