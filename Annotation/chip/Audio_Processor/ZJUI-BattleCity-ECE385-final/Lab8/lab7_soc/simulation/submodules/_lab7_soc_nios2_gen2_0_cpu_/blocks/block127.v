  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_implicit_dst_eretaddr <= 0;
      else if (R_en)
          R_ctrl_implicit_dst_eretaddr <= R_ctrl_implicit_dst_eretaddr_nxt;
    end