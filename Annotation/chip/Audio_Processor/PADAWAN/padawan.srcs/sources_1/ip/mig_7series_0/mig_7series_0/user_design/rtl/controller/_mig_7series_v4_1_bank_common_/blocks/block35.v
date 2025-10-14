  always @(idle_r) begin
    idle_cnt = BM_CNT_ZERO;
    for (i = 0; i < nBANK_MACHS; i = i + 1)
      if (idle_r[i]) idle_cnt = idle_cnt + BM_CNT_ONE;
  end