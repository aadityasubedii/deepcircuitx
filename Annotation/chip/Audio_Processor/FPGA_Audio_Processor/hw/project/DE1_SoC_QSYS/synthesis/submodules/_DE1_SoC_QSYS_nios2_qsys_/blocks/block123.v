  assign W_status_reg_pie_inst_nxt = (R_ctrl_exception | R_ctrl_break | R_ctrl_crst) ? 1'b0 :
    (D_op_eret)                     ? W_estatus_reg :
    (D_op_bret)                     ? W_bstatus_reg :
    (E_wrctl_status)                ? E_src1[0] :
    W_status_reg_pie;