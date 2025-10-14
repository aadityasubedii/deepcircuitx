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