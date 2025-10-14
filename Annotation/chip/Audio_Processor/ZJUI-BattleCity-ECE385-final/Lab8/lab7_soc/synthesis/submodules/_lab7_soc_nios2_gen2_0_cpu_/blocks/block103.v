  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_rd_ctl_reg <= 0;
      else if (R_en)
          R_ctrl_rd_ctl_reg <= R_ctrl_rd_ctl_reg_nxt;
    end