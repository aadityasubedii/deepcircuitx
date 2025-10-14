  always @(next) begin
     bank_mach_next = BM_CNT_ZERO;
    for (i = 0; i <= nBANK_MACHS-1; i = i + 1)
      if (next[i]) bank_mach_next = i[BM_CNT_WIDTH-1:0];
  end