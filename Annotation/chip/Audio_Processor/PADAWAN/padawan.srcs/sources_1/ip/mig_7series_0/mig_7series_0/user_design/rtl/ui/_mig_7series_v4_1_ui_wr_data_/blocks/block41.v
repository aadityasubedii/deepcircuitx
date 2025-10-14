      always @(new_rd_data or rd_data_indx_r or rst) begin
        rd_data_indx_ns = rd_data_indx_r;
        if (rst) rd_data_indx_ns = 5'b0;
        else if (new_rd_data) rd_data_indx_ns = rd_data_indx_r + 5'h1;
      end