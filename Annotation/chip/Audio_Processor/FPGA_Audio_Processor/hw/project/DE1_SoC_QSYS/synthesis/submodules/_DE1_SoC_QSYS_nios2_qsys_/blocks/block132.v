  assign W_wr_data_non_zero = R_ctrl_br_cmp ? W_cmp_result :
    R_ctrl_rdctl_inst       ? W_control_rd_data :
    W_alu_result[31 : 0];