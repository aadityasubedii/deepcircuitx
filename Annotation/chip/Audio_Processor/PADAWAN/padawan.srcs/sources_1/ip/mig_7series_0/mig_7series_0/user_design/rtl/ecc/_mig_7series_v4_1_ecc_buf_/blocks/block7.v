      always @(posedge clk) 
        buf_rd_addr_r <= #TCQ{{4-DATA_BUF_ADDR_WIDTH{1'b0}},
                               wr_data_addr[DATA_BUF_ADDR_WIDTH-1:0],
                               wr_data_offset};
      assign buf_wr_addr = {{4-DATA_BUF_ADDR_WIDTH{1'b0}},
                            rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0], 
                            rd_data_offset};
    end