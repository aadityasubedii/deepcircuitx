  assign E_wrctl_bstatus = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 5'd2);