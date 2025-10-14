  generate
    for (i=0; i<2*nCK_PER_CLK; i=i+1) begin : extract_payload
      assign ecc_rddata_ns[i*PAYLOAD_WIDTH+:PAYLOAD_WIDTH] =
               phy_rddata[i*DQ_WIDTH+:PAYLOAD_WIDTH];
    end
  endgenerate