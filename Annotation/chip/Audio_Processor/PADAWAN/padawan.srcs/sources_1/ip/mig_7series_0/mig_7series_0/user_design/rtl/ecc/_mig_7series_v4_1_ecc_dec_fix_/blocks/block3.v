        always @(ecc_rddata_r)
          rd_data[(t+1)*PAYLOAD_WIDTH-1-:RAW_BIT_WIDTH] =
            ecc_rddata_r[(t+1)*PAYLOAD_WIDTH-1-:RAW_BIT_WIDTH];
      end