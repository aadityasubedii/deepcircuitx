  generate
    begin : read_fifo

      wire [MC_ERR_LINE_WIDTH:0] ecc_line;
      if (CS_WIDTH == 1)
        assign ecc_line = {col_rmw, col_ba, col_row, col_a_extracted};
      else
        assign ecc_line = {col_rmw,
                           col_ra,
                           col_ba,
                           col_row,
                           col_a_extracted};

      wire [FIFO_WIDTH-1:0] real_fifo_data;
      if (ECC == "OFF")
         assign real_fifo_data = {data_end,
                                  col_periodic_rd,
                                  col_data_buf_addr,
                                  offset_r[DATA_BUF_OFFSET_WIDTH-1:0]};
      else
         assign real_fifo_data = {data_end,
                                  col_periodic_rd,
                                  col_data_buf_addr,
                                  offset_r[DATA_BUF_OFFSET_WIDTH-1:0],
                                  ecc_line};

      wire [RAM_WIDTH-1:0] fifo_in_data;
      if (REMAINDER == 0)
        assign fifo_in_data = real_fifo_data;
      else
        assign fifo_in_data = {{6-REMAINDER{1'b0}}, real_fifo_data};

      wire [RAM_WIDTH-1:0] fifo_out_data_ns;

      reg [4:0] head_r;
      wire [4:0] head_ns = rst ? 5'b0 : read_data_valid
                                          ? (head_r + 5'b1)
                                          : head_r;