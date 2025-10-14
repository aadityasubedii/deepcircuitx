  assign wr_data_offset = (DELAY_WR_DATA_CNTRL == 1)
                            ? offset_r1[DATA_BUF_OFFSET_WIDTH-1:0]
                            : (EARLY_WR_DATA_ADDR == "OFF")
                              ? offset_r[DATA_BUF_OFFSET_WIDTH-1:0]
                              : offset_ns[DATA_BUF_OFFSET_WIDTH-1:0];