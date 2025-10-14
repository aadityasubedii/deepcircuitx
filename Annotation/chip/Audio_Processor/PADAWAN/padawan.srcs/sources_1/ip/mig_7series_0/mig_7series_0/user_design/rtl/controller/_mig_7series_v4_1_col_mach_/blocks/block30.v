  output wire wr_data_en;
  assign wr_data_en = (DELAY_WR_DATA_CNTRL == 1)
                              ? ((sent_col_r1 || |offset_r1) && ~col_rd_wr_r1)
                              : ((sent_col || |offset_r) && ~col_rd_wr);