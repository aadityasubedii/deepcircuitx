  always @(bm_end_r1 or ras_timer_r or rst or start_rcd_lcl
           or start_wtp_timer) begin
    if (bm_end_r1 || rst) ras_timer_ns = ZERO[RAS_TIMER_WIDTH-1:0];
    else begin
      ras_timer_ns = ras_timer_r;
      if (start_rcd_lcl) ras_timer_ns =
           nRAS_CLKS[RAS_TIMER_WIDTH-1:0] - TWO[RAS_TIMER_WIDTH-1:0];
      if (start_wtp_timer) ras_timer_ns =
            
            
           (ras_timer_r <= (nWTP_CLKS-2)) ? nWTP_CLKS[RAS_TIMER_WIDTH-1:0] - TWO[RAS_TIMER_WIDTH-1:0]
                                          : ras_timer_r - ONE[RAS_TIMER_WIDTH-1:0];
      if (|ras_timer_r && ~start_wtp_timer) ras_timer_ns =
           ras_timer_r - ONE[RAS_TIMER_WIDTH-1:0];
    end
  end 