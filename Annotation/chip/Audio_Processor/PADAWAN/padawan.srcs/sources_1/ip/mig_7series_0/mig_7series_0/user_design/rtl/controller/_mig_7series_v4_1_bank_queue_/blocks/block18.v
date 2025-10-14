  assign passing_open_bank =
  pre_passing_open_bank_r || (sending_col_not_rmw_rd && pass_open_bank_r_lcl);