  generate
    for (q=0; q<2*nCK_PER_CLK; q=q+1) begin : flip_word
      for (r=0; r<DATA_WIDTH; r=r+1) begin : flip_bit
        assign flip_bits[q*DATA_WIDTH+r] = 
          h_matrix[r] == syndrome_r[q*ECC_WIDTH+:ECC_WIDTH];
      end
    end
  endgenerate