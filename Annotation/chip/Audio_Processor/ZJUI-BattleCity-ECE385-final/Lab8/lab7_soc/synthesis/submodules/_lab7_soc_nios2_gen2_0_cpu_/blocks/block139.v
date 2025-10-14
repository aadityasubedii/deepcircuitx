  assign W_cpuid_reg = 0;
  assign W_wr_data_non_zero = R_ctrl_br_cmp ? W_cmp_result :
    R_ctrl_rd_ctl_reg       ? W_control_rd_data :
    W_alu_result[31 : 0];

  assign W_wr_data = W_wr_data_non_zero;
  assign W_br_taken = R_ctrl_br_uncond | (R_ctrl_br & W_cmp_result);
  assign W_mem_baddr = W_alu_result[28 : 0];
  assign W_status_reg = W_status_reg_pie;
  assign E_wrctl_status = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 5'd0);