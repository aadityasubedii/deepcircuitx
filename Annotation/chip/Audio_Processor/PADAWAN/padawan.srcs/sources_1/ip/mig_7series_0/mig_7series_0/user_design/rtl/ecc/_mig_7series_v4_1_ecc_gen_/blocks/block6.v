  generate
    for (n=0; n<CODE_WIDTH; n=n+1) begin : ht
      if (n == 0)                
         assign ht_matrix[n] = {{3{1'b1}}, {ECC_WIDTH-3{1'b0}}};
      else if (n == COMBOS_3 && n < DATA_WIDTH)    
         assign ht_matrix[n] = {{5{1'b1}}, {ECC_WIDTH-5{1'b0}}};
      else if ((n == COMBOS_3+COMBOS_5) && n < DATA_WIDTH)    
         assign ht_matrix[n] = {{7{1'b1}}, {ECC_WIDTH-7{1'b0}}};
      else if (n == DATA_WIDTH)   
         assign ht_matrix[n] = {{1{1'b1}}, {ECC_WIDTH-1{1'b0}}};
      else assign ht_matrix[n] = next_combo(ht_matrix[n-1]);
      
      for (s=0; s<ECC_WIDTH; s=s+1) begin : h_row
        assign h_rows[s*CODE_WIDTH+n] = ht_matrix[n][s];
      end
    end
  endgenerate 