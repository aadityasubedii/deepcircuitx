    else begin : delay_wr_data_cntrl_ne_1
      assign wr_data_addr = col_wr_data_buf_addr;
    end