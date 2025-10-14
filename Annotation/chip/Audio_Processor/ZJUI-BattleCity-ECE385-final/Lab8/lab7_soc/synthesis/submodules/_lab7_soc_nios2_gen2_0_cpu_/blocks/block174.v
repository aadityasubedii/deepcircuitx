  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_invert_arith_src_msb <= 0;
      else 
        E_invert_arith_src_msb <= D_ctrl_alu_signed_comparison & R_valid;
    end