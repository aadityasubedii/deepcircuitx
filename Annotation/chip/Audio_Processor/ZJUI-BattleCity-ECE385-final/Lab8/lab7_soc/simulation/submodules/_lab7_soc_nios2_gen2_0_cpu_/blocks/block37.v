  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_mem8 <= 0;
      else if (R_en)
          R_ctrl_mem8 <= R_ctrl_mem8_nxt;
    end