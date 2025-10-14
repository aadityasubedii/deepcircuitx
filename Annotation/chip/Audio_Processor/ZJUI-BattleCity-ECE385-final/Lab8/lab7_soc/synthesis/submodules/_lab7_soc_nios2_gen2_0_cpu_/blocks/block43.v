  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ld_non_io <= 0;
      else if (R_en)
          R_ctrl_ld_non_io <= R_ctrl_ld_non_io_nxt;
    end