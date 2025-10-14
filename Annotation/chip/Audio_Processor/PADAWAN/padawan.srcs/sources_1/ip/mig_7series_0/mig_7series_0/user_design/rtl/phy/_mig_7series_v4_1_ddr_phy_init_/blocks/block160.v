  always @(posedge clk)
    if (!cnt_pwron_cke_done_r) begin
      cnt_txpr_r      <= #TCQ 'b0;
      cnt_txpr_done_r <= #TCQ 1'b0;
    end else begin
      cnt_txpr_r <= #TCQ cnt_txpr_r + 1;
      if (!cnt_txpr_done_r)
        cnt_txpr_done_r <= #TCQ (cnt_txpr_r == TXPR_DELAY_CNT);
    end