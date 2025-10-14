      always @(rd_buf_indx_r or rst or single_data
               or upd_rd_buf_indx) begin
        rd_buf_indx_ns = rd_buf_indx_r;
        if (rst) rd_buf_indx_ns = 6'b0;
        else if (upd_rd_buf_indx) rd_buf_indx_ns =
          
          rd_buf_indx_r + 6'h1 + (DATA_BUF_ADDR_WIDTH == 5 ? 0 : single_data);
      end