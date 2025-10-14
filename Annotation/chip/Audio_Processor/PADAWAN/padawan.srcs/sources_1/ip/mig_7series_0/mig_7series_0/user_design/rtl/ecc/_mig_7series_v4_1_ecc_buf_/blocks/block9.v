      always @(posedge clk)  
        buf_rd_addr_r <= #TCQ{wr_data_addr[3:0], wr_data_offset};
      assign buf_wr_addr = {rd_data_addr[3:0], rd_data_offset};
    end