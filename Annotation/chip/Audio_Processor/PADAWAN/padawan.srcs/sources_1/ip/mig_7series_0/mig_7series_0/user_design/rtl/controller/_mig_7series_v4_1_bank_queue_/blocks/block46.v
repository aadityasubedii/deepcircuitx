  always @(bm_end_in) begin
    idlers_above = 1'b0;
    for (i=ID+1; i<ID+nBANK_MACHS; i=i+1)
      idlers_above = idlers_above || bm_end_in[i];
  end