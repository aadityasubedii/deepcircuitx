      always @(col_addr or col_cmd_r or col_data_buf_addr_r
               or col_periodic_rd_r or col_rmw_r or col_row_r
               or col_size_r or grant_col_r or rd_wr_r or req_bank_r
               or req_data_buf_addr_r or req_periodic_rd_r
               or req_rank_r or req_row_r or req_size_r or req_wr_r
               or rst or col_rd_wr_r)
        begin
          col_periodic_rd_ns = ~rst && col_periodic_rd_r;
          col_cmd_ns = {(rst ? {RANK_WIDTH{1'b0}}
                             : col_cmd_r[(OUT_CMD_WIDTH-1)-:RANK_WIDTH]),
                        ((rst && ECC != "OFF")
                           ? {OUT_CMD_WIDTH-3-RANK_WIDTH{1'b0}}
                           : col_cmd_r[3+:(OUT_CMD_WIDTH-3-RANK_WIDTH)]),
                        (rst ? 3'b0 : col_cmd_r[2:0])};
          col_rmw_ns = col_rmw_r;
          col_size_ns = rst ? 1'b0 : col_size_r;
          col_row_ns = col_row_r;
          col_rd_wr_ns = col_rd_wr_r;
          col_data_buf_addr_ns = col_data_buf_addr_r;
          for (i=0; i<nBANK_MACHS; i=i+1)
            if (grant_col_r[i]) begin
              col_periodic_rd_ns = req_periodic_rd_r[i];
              col_cmd_ns = {req_rank_r[(RANK_WIDTH*i)+:RANK_WIDTH],
                            req_bank_r[(BANK_WIDTH*i)+:BANK_WIDTH],
                            col_addr[(ROW_WIDTH*i)+:ROW_WIDTH],
                            1'b1,
                            1'b0,
                            rd_wr_r[i]};
              col_rmw_ns = req_wr_r[i] && rd_wr_r[i];
              col_size_ns = req_size_r[i];
              col_row_ns = req_row_r[(ROW_WIDTH*i)+:ROW_WIDTH];
              col_rd_wr_ns = rd_wr_r[i];
              col_data_buf_addr_ns =
           req_data_buf_addr_r[(DATA_BUF_ADDR_WIDTH*i)+:DATA_BUF_ADDR_WIDTH];
            end
        end 