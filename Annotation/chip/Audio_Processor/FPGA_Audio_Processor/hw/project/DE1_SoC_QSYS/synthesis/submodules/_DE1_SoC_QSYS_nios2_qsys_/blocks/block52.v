  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_br_uncond <= 0;
      else if (R_en)
          R_ctrl_br_uncond <= R_ctrl_br_uncond_nxt;
    end