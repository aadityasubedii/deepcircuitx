        assign col_periodic_rd = col_periodic_rd_r;
        assign col_ra = col_cmd_r[3+ROW_WIDTH+BANK_WIDTH+:RANK_WIDTH];
        assign col_ba = col_cmd_r[3+ROW_WIDTH+:BANK_WIDTH];
        assign col_a = col_cmd_r[3+:ROW_WIDTH];
        assign col_rmw = col_rmw_r;
        assign col_rd_wr = col_rd_wr_r;
        assign col_size = col_size_r;
        assign col_row = col_row_r;
        assign col_data_buf_addr = col_data_buf_addr_r;
      
      end