      else begin
      
        assign col_periodic_rd = col_periodic_rd_ns;
        assign col_ra = col_cmd_ns[3+ROW_WIDTH+BANK_WIDTH+:RANK_WIDTH];
        assign col_ba = col_cmd_ns[3+ROW_WIDTH+:BANK_WIDTH];
        assign col_a = col_cmd_ns[3+:ROW_WIDTH];
        assign col_rmw = col_rmw_ns;
        assign col_rd_wr = col_rd_wr_ns;
        assign col_size = col_size_ns;
        assign col_row = col_row_ns;
        assign col_data_buf_addr = col_data_buf_addr_ns;
        
      end