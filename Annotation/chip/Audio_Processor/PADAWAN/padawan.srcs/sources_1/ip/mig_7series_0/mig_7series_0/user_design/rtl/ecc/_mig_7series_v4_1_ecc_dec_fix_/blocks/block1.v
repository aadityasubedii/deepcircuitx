  generate
    for (v=0; v<2*nCK_PER_CLK; v=v+1) begin : compute_status
      wire zero = ~|syndrome_r[v*ECC_WIDTH+:ECC_WIDTH];
      wire odd = ^syndrome_r[v*ECC_WIDTH+:ECC_WIDTH];
      assign ecc_single[v] = ecc_status_valid && ~zero && odd;
      assign ecc_multiple[v] = ecc_status_valid && ~zero && ~odd;
    end
  endgenerate