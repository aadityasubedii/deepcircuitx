        always @(posedge clk) col_wr_data_buf_addr_r <= 
                                #TCQ col_wr_data_buf_addr_ns;
        assign col_wr_data_buf_addr = col_wr_data_buf_addr_ns;
      end