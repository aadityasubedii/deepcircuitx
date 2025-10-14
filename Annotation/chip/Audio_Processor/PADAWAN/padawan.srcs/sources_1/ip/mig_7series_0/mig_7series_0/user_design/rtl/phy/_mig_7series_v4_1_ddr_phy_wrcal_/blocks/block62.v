  always @(*) begin
    for (d = 0; d < DQS_WIDTH; d = d + 1) begin
      po_fine_tap_cnt_w[(6*d)+:6]   = po_fine_tap_cnt[d];
      po_coarse_tap_cnt_w[(3*d)+:3] = po_coarse_tap_cnt[d];
    end
  end