  output [APP_DATA_WIDTH-1:0] wr_data;
  output [APP_MASK_WIDTH-1:0] wr_data_mask;
  assign {wr_data_mask, wr_data} = wr_buf_out_data[WR_BUF_WIDTH-1:0];