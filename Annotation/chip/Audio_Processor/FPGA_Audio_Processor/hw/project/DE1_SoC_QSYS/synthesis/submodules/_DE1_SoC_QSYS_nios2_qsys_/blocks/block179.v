  assign E_control_rd_data = (D_iw_control_regnum == 3'd0)? W_status_reg :
    (D_iw_control_regnum == 3'd1)? W_estatus_reg :
    (D_iw_control_regnum == 3'd2)? W_bstatus_reg :
    (D_iw_control_regnum == 3'd3)? W_ienable_reg :
    (D_iw_control_regnum == 3'd4)? W_ipending_reg :
    W_cpuid_reg;