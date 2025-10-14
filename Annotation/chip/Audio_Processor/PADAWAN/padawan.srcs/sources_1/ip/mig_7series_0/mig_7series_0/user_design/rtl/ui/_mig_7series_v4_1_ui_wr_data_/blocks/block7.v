  generate
    begin : write_buffer
      wire [RAM_WIDTH-1:0] wr_buf_in_data;
      if (REMAINDER == 0)
        if (ECC_TEST == "OFF")
          assign wr_buf_in_data = {app_wdf_mask_ns1, app_wdf_data_ns1};
        else
          assign wr_buf_in_data = 
                   {app_raw_not_ecc_r1, app_wdf_mask_ns1, app_wdf_data_ns1};
      else
        if (ECC_TEST == "OFF")
          assign wr_buf_in_data =
               {{6-REMAINDER{1'b0}}, app_wdf_mask_ns1, app_wdf_data_ns1};
        else 
          assign wr_buf_in_data = {{6-REMAINDER{1'b0}}, app_raw_not_ecc_r1,
                                   app_wdf_mask_ns1, app_wdf_data_ns1};

      wire [4:0] rd_addr_w;

assign rd_addr_w = {wr_data_addr, wr_data_offset};