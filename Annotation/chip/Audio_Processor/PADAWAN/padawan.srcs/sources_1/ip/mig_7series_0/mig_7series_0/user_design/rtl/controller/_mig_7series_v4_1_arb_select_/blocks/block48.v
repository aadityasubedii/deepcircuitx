      if (EARLY_WR_DATA_ADDR == "OFF") begin : early_wr_data_addr_off
        assign col_wr_data_buf_addr = col_data_buf_addr_ns;
      end