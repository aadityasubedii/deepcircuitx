      always @(rp_timer_r or rst or start_pre)
        if (rst) rp_timer_ns = ZERO[RP_TIMER_WIDTH-1:0];
        else begin
          rp_timer_ns = rp_timer_r;
          if (start_pre) rp_timer_ns = nRP_CLKS_M2[RP_TIMER_WIDTH-1:0];
          else if (|rp_timer_r) rp_timer_ns =
                                  rp_timer_r - ONE[RP_TIMER_WIDTH-1:0];
        end