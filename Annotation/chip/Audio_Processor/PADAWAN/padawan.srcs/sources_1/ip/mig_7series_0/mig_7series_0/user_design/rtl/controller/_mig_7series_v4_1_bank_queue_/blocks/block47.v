  always @(bm_end_in) begin
    idlers_below = BM_CNT_ZERO;
    for (i=0; i<ID; i=i+1)
      idlers_below = idlers_below + bm_end_in[i];
   end