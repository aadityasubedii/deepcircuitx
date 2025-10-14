  always @(pass_open_bank_r or rst or rtp_timer_r
           or sending_col_not_rmw_rd) begin
    rtp_timer_ns = rtp_timer_r;
    if (rst || pass_open_bank_r)
      rtp_timer_ns = ZERO[RTP_TIMER_WIDTH-1:0];
    else begin
      if (sending_col_not_rmw_rd) 
         rtp_timer_ns = nRTP_CLKS_M1[RTP_TIMER_WIDTH-1:0];
      if (|rtp_timer_r) rtp_timer_ns = rtp_timer_r - ONE[RTP_TIMER_WIDTH-1:0];
    end
  end