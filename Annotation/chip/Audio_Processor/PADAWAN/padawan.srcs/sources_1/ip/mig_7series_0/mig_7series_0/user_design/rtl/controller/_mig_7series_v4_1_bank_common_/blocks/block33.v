  always @(ordered_r) begin
    order_cnt = BM_CNT_ZERO;
    for (i = 0; i < nBANK_MACHS; i = i + 1)
      if (ordered_r[i]) order_cnt = order_cnt + BM_CNT_ONE;
  end