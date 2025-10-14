      always @(posedge clk) wr_data_addr_r <= #TCQ wr_data_addr;
    end