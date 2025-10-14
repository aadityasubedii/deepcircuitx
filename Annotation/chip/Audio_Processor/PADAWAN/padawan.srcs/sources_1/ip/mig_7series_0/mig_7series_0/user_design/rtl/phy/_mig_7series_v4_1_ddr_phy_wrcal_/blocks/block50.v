  always @(posedge clk) begin
    if (rst) begin
      for (p = 0; p < DQS_WIDTH; p = p + 1) begin
        po_coarse_tap_cnt[p] <= #TCQ {3{1'b0}};
        po_fine_tap_cnt[p]   <= #TCQ {6{1'b0}};
      end
    end else if (cal2_done_r && ~cal2_done_r1) begin
      for (q = 0; q < DQS_WIDTH; q = q + 1) begin
        po_coarse_tap_cnt[q] <= #TCQ wl_po_coarse_cnt_w[i];
        po_fine_tap_cnt[q]   <= #TCQ wl_po_fine_cnt_w[i];
      end
    end
  end