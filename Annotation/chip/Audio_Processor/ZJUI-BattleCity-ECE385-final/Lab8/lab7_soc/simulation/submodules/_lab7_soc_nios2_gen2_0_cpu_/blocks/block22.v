  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ignore_dst <= 0;
      else if (R_en)
          R_ctrl_ignore_dst <= R_ctrl_ignore_dst_nxt;
    end