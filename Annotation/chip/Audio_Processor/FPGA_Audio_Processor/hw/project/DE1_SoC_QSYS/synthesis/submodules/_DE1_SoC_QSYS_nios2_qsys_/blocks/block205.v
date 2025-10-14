  assign R_src2_lo = ((R_ctrl_force_src2_zero|R_ctrl_hi_imm16))? 16'b0 :
    (R_src2_use_imm)? D_iw_imm16 :
    R_rf_b[15 : 0];