      for (s=0; s<ECC_WIDTH; s=s+1) begin : h_row
        assign h_rows[s*CODE_WIDTH+n] = ht_matrix[n][s];
      end