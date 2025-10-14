  assign R_src1 = (((R_ctrl_br & E_valid_from_R) | (R_ctrl_retaddr & R_valid)))? {F_pc_plus_one, 2'b00} :
    ((R_ctrl_jmp_direct & E_valid_from_R))? {D_jmp_direct_target_waddr, 2'b00} :
    R_rf_a;

  assign R_src2_lo = ((R_ctrl_force_src2_zero|R_ctrl_hi_imm16))? {16 {D_ctrl_set_src2_rem_imm}} :
    (R_ctrl_src_imm5_shift_rot)? {{11 {1'b0}},D_iw_imm5} :
    (R_src2_use_imm)? D_iw_imm16 :
    R_rf_b[15 : 0];

  assign R_src2_hi = ((R_ctrl_force_src2_zero|R_ctrl_unsigned_lo_imm16))? {16 {D_ctrl_set_src2_rem_imm}} :
    (R_ctrl_hi_imm16)? D_iw_imm16 :
    (R_src2_use_imm)? {16 {D_iw_imm16[15]}} :
    R_rf_b[31 : 16];

  assign R_src2 = {R_src2_hi, R_src2_lo};