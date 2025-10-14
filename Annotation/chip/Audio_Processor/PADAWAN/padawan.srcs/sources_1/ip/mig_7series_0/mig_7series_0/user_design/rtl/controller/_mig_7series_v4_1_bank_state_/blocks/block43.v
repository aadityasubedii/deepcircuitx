  generate
    if (nRP_CLKS_M2 > ZERO) begin : rp_timer
      reg [RP_TIMER_WIDTH-1:0] rp_timer_ns;
      always @(rp_timer_r or rst or start_pre)