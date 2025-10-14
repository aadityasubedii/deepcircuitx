  assign d_read_nxt = (R_ctrl_ld & E_new_inst & ~E_rf_ecc_valid_any) | (d_read & d_waitrequest);
  assign E_ld_stall = R_ctrl_ld & ((E_valid & ~av_ld_done) | E_new_inst);
  assign d_write_nxt = ((R_ctrl_st & (~R_ctrl_st_ex | W_up_ex_mon_state)) & E_new_inst & ~E_rf_ecc_valid_any) | (d_write & d_waitrequest);
  assign E_st_stall = d_write_nxt;
  assign d_address = W_mem_baddr;
  assign av_ld_getting_data = d_read & ~d_waitrequest;