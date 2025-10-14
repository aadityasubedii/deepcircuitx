  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_logic <= 0;
      else if (R_en)
          R_ctrl_logic <= R_ctrl_logic_nxt;
    end