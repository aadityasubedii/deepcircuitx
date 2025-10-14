  generate
    begin : col_mux
      reg col_periodic_rd_ns;
      reg col_periodic_rd_r;
      reg col_rmw_ns;
      reg col_rmw_r;
      reg col_size_ns;
      reg col_size_r;
      reg [ROW_WIDTH-1:0] col_row_ns;
      reg [ROW_WIDTH-1:0] col_row_r;
      reg [DATA_BUF_ADDR_WIDTH-1:0] col_data_buf_addr_ns;
      reg [DATA_BUF_ADDR_WIDTH-1:0] col_data_buf_addr_r;