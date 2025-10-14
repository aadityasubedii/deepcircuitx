        always @(posedge clk) status_ram_wr_data_r <=
                              #TCQ status_ram_wr_data_ns;
        reg rd_buf_we_r1;