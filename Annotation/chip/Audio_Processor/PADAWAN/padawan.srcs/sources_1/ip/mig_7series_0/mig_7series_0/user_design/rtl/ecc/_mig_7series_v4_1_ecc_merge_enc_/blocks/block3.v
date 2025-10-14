      always @(h_rows or merged_data or raw_not_ecc_r) begin
        mc_wrdata_c[j*DQ_WIDTH+:DQ_WIDTH] =
          {{DQ_WIDTH-PAYLOAD_WIDTH{1'b0}},
           merged_data[j*PAYLOAD_WIDTH+:PAYLOAD_WIDTH]};
        for (k=0; k<ECC_WIDTH; k=k+1)
          if (~raw_not_ecc_r[j])
            mc_wrdata_c[j*DQ_WIDTH+CODE_WIDTH-k-1] =
              ^(merged_data[j*PAYLOAD_WIDTH+:DATA_WIDTH] & 
                h_rows[k*CODE_WIDTH+:DATA_WIDTH]);
      end
    end