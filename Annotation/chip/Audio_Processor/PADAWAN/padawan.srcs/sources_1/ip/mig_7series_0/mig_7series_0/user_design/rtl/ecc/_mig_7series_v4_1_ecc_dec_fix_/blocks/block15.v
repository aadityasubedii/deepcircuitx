  generate
    for (k=0; k<2*nCK_PER_CLK; k=k+1) begin : ecc_word
      for (m=0; m<ECC_WIDTH; m=m+1) begin : ecc_bit
        assign syndrome_ns[k*ECC_WIDTH+m] =
   ^(phy_rddata[k*DQ_WIDTH+:CODE_WIDTH] & h_rows[m*CODE_WIDTH+:CODE_WIDTH]);
      end
    end
  endgenerate