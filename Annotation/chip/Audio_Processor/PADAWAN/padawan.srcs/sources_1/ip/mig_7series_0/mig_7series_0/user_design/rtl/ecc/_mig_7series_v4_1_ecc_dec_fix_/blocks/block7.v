  always @(correct_en or ecc_rddata_r or flip_bits)
    for (s=0; s<2*nCK_PER_CLK; s=s+1)
      if (correct_en)
        rd_data[s*PAYLOAD_WIDTH+:DATA_WIDTH] = 
          ecc_rddata_r[s*PAYLOAD_WIDTH+:DATA_WIDTH] ^ 
              flip_bits[s*DATA_WIDTH+:DATA_WIDTH];
      else rd_data[s*PAYLOAD_WIDTH+:DATA_WIDTH] = 
           ecc_rddata_r[s*PAYLOAD_WIDTH+:DATA_WIDTH];
