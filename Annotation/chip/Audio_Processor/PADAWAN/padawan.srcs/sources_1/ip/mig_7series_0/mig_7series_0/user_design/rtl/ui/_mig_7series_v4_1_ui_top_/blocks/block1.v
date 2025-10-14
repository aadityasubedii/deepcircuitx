  generate
    if(DATA_BUF_ADDR_WIDTH > 4) begin
      assign wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:4] = 0;
    end
  endgenerate