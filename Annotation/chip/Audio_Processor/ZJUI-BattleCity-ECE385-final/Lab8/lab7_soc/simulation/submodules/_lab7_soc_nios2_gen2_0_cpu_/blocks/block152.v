  assign W_bstatus_reg_inst_nxt = (R_ctrl_break)       ? W_status_reg :
    (E_wrctl_bstatus)    ? E_src1[0] :
    W_bstatus_reg;