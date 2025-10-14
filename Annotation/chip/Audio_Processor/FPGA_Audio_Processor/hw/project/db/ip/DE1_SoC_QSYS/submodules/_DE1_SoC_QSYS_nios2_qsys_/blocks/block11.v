  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_force_src2_zero <= 0;
      else if (R_en)
          R_ctrl_force_src2_zero <= R_ctrl_force_src2_zero_nxt;
    end