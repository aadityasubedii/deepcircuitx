  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_st_ex <= 0;
      else if (R_en)
          R_ctrl_st_ex <= R_ctrl_st_ex_nxt;
    end