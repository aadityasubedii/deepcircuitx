  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_wrctl_inst <= 0;
      else if (R_en)
          R_ctrl_wrctl_inst <= R_ctrl_wrctl_inst_nxt;
    end