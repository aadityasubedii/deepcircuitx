  generate
    if (ORDERING == "STRICT") begin : strict_mode
      assign app_rd_data_valid_ns = 1'b0;
      assign single_data = 1'b0;
      assign rd_buf_full = 1'b0;
      reg [DATA_BUF_ADDR_WIDTH-1:0] rd_data_buf_addr_r_lcl;
      wire [DATA_BUF_ADDR_WIDTH-1:0] rd_data_buf_addr_ns =
                   rst
                    ? 0
                    : rd_data_buf_addr_r_lcl + rd_accepted;