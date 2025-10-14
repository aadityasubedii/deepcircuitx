  always @(*) begin
    for (m = 0; m < DQS_WIDTH; m = m + 1) begin
      wl_po_coarse_cnt_w[m] = wl_po_coarse_cnt[3*m+:3];
      wl_po_fine_cnt_w[m]   = wl_po_fine_cnt[6*m+:6];
    end
  end