        always @(col_wr_data_buf_addr_r or grant_col_wr
                 or req_data_buf_addr_r) begin
          col_wr_data_buf_addr_ns = col_wr_data_buf_addr_r;
          for (i=0; i<nBANK_MACHS; i=i+1)
            if (grant_col_wr[i])
              col_wr_data_buf_addr_ns =
           req_data_buf_addr_r[(DATA_BUF_ADDR_WIDTH*i)+:DATA_BUF_ADDR_WIDTH];
        end