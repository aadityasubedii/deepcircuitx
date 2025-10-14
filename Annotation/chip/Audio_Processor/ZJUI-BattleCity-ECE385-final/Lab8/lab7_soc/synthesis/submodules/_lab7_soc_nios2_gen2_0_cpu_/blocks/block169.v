  assign E_control_rd_data = (D_iw_control_regnum == 5'd0)? W_status_reg :
    (D_iw_control_regnum == 5'd1)? W_estatus_reg :
    (D_iw_control_regnum == 5'd2)? W_bstatus_reg :
    (D_iw_control_regnum == 5'd3)? W_ienable_reg :
    (D_iw_control_regnum == 5'd4)? W_ipending_reg :
    (D_iw_control_regnum == 5'd5)? W_cpuid_reg :
    W_cdsr_reg;