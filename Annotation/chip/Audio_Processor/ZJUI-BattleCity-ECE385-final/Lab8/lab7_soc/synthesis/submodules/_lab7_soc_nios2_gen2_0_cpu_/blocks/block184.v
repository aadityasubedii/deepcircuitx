  assign R_rf_a = R_rf_a_q;
  assign R_rf_b = R_rf_b_q;
  assign W_rf_wren = (R_wr_dst_reg & W_valid) | W_rf_ecc_valid_any | ~reset_n;
  assign W_rf_wr_data = R_ctrl_ld ? av_ld_data_aligned_filtered : W_wr_data;