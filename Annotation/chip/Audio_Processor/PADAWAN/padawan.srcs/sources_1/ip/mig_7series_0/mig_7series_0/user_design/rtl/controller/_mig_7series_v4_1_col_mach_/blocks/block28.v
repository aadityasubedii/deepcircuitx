  generate
    if (DELAY_WR_DATA_CNTRL == 1) begin : delay_wr_data_cntrl_eq_1
      reg [DATA_BUF_ADDR_WIDTH-1:0] col_wr_data_buf_addr_r;