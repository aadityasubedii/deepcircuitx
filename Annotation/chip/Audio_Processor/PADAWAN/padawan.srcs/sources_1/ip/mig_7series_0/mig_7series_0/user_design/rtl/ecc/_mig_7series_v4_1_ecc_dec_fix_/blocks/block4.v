  generate
    if (RAW_BIT_WIDTH > 0)
      for (t=0; t<2*nCK_PER_CLK; t=t+1) begin : copy_raw_bits
        always @(ecc_rddata_r)
          rd_data[(t+1)*PAYLOAD_WIDTH-1-:RAW_BIT_WIDTH] =
            ecc_rddata_r[(t+1)*PAYLOAD_WIDTH-1-:RAW_BIT_WIDTH];