      always @(data_buf_addr_cnt_r or rst or wr_accepted) begin
        data_buf_addr_cnt_ns = data_buf_addr_cnt_r;
        if (rst) data_buf_addr_cnt_ns = 4'b0;
        else if (wr_accepted) data_buf_addr_cnt_ns =
                                data_buf_addr_cnt_r + 4'h1;
      end