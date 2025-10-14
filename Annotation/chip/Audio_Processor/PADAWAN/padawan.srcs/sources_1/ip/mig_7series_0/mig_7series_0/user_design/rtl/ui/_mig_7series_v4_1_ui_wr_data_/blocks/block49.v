  generate
    if (ECC == "OFF" || CWL >= 0) begin : pass_wr_addr
      always @(wr_data_offset) wr_data_offset_r = wr_data_offset;