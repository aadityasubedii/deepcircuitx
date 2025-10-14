        always @(rd_accepted or rd_data_buf_addr_r_lcl or rst) begin
          rd_data_buf_addr_ns = rd_data_buf_addr_r_lcl;
          if (rst) rd_data_buf_addr_ns = 0;
          else if (rd_accepted) rd_data_buf_addr_ns =
                                  rd_data_buf_addr_r_lcl + 1;
        end