  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_mem32 <= 0;
      else if (R_en)
          R_ctrl_mem32 <= R_ctrl_mem32_nxt;
    end