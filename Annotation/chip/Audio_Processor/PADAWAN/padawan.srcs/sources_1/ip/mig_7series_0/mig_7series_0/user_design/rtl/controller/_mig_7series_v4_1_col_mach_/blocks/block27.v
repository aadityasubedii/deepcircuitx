      always @(posedge clk) col_wr_data_buf_addr_r <= 
                              #TCQ col_wr_data_buf_addr;
      assign wr_data_addr = col_wr_data_buf_addr_r;
    end