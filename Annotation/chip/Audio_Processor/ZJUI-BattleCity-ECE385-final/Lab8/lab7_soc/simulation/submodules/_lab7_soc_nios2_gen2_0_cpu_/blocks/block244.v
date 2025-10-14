  assign R_src2_hi = ((R_ctrl_force_src2_zero|R_ctrl_unsigned_lo_imm16))? {16 {D_ctrl_set_src2_rem_imm}} :
    (R_ctrl_hi_imm16)? D_iw_imm16 :
    (R_src2_use_imm)? {16 {D_iw_imm16[15]}} :
    R_rf_b[31 : 16];