  assign W_estatus_reg_inst_nxt = (R_ctrl_crst)        ? 0 :
    (R_ctrl_exception|W_rf_ecc_unrecoverable_valid)   ? W_status_reg :
    (E_wrctl_estatus)    ? E_src1[0] :
    W_estatus_reg;