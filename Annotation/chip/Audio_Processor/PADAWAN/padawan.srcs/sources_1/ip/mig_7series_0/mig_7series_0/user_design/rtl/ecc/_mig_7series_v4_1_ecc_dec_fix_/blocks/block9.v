  generate
    for (n=0; n<DATA_WIDTH; n=n+1) begin : h_col
      for (p=0; p<ECC_WIDTH; p=p+1) begin : h_bit
        assign h_matrix [n][p] = h_rows [p*CODE_WIDTH+n];
      end
    end
  endgenerate             