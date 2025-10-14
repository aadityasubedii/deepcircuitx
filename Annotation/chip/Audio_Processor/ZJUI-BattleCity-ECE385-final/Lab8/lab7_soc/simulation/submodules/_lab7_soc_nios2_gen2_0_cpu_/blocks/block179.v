  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_up_ex_mon_state <= 0;
      else if (R_en)
          W_up_ex_mon_state <= (R_ctrl_ld_ex & W_valid) ? 1'b1 :
                    ((D_op_eret & W_valid) | (R_ctrl_st_ex & W_valid)) ? 1'b0 : 
                    W_up_ex_mon_state;

    end