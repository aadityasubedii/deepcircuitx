  always @(rb_hit_busy_r) begin
    rb_hit_busy_cnt = BM_CNT_ZERO;
    for (i = 0; i < nBANK_MACHS; i = i + 1)
      if (rb_hit_busy_r[i]) rb_hit_busy_cnt = rb_hit_busy_cnt + BM_CNT_ONE;
  end