  generate
     if (ROW_WIDTH >= 14) begin : COL_A_FULL_11_1
        assign col_a_full[11] = col_a[13];
     end else begin : COL_A_FULL_11_0
        assign col_a_full[11] = 0;
     end
  endgenerate