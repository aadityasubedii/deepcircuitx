  output wire [2*nCK_PER_CLK*DATA_WIDTH-1:0] rd_merge_data;
  assign rd_merge_data = buf_out_data[2*nCK_PER_CLK*DATA_WIDTH-1:0];