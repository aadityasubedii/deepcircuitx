      else begin : early_wr_data_addr_on
        reg [DATA_BUF_ADDR_WIDTH-1:0] col_wr_data_buf_addr_ns;
        reg [DATA_BUF_ADDR_WIDTH-1:0] col_wr_data_buf_addr_r;