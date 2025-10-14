      always @(rst or wr_data_addr_le or wr_data_indx_r) begin
        wr_data_indx_ns = wr_data_indx_r;
        if (rst) wr_data_indx_ns = 4'b1;
        else if (wr_data_addr_le) wr_data_indx_ns = wr_data_indx_r + 4'h1;
      end