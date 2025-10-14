  assign E_rf_ecc_valid_any = E_rf_ecc_recoverable_valid|E_rf_ecc_unrecoverable_valid;
  assign W_rf_ecc_valid_any = W_rf_ecc_recoverable_valid|W_rf_ecc_unrecoverable_valid;
  assign E_rf_ecc_recoverable_valid = 1'b0;
  assign E_rf_ecc_unrecoverable_valid = 1'b0;
  assign W_dst_regnum = R_dst_regnum;