      wire [APP_DATA_WIDTH-1:0] app_rd_data_ns =
                              bypass
                                ? rd_data
                                : rd_buf_out_data[APP_DATA_WIDTH-1:0];