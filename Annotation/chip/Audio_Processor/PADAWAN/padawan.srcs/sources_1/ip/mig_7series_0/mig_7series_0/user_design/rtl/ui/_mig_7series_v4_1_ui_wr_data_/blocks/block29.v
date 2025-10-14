      always @(rst or wb_wr_data_addr_r or wr_data_addr_le
               or wr_data_pntr) begin
        wb_wr_data_addr_ns = wb_wr_data_addr_r;
        if (rst) wb_wr_data_addr_ns = 4'b0;
        else if (wr_data_addr_le) wb_wr_data_addr_ns = wr_data_pntr;
      end