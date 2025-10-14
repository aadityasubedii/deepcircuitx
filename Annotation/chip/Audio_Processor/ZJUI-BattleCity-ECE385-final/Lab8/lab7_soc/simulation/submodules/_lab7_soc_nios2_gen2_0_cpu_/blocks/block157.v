  assign E_wrctl_ienable = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 5'd3);