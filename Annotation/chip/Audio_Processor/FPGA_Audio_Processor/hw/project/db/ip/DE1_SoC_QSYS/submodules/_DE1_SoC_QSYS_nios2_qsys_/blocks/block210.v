  assign R_src1 = (((R_ctrl_br & E_valid) | (R_ctrl_retaddr & R_valid)))? {F_pc_plus_one, 2'b00} :
    ((R_ctrl_jmp_direct & E_valid))? {D_jmp_direct_target_waddr, 2'b00} :
    R_rf_a;