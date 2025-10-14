  assign bm_end_lcl = 
          pre_bm_end_r || (sending_col_not_rmw_rd && pass_open_bank_r_lcl);
  output wire bm_end;
  assign bm_end = bm_end_lcl;