  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          hbreak_enabled <= 1'b1;
      else if (E_valid)
          hbreak_enabled <= R_ctrl_break ? 1'b0 : D_op_bret ? 1'b1 : hbreak_enabled;
    end