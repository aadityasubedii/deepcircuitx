
  assign E_wrctl_estatus = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 5'd1);

  assign E_wrctl_bstatus = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 5'd2);

  assign E_wrctl_ienable = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 5'd3);