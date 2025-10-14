      always @(rcd_timer_r or rst or start_rcd_lcl) begin
        if (rst) rcd_timer_ns = ZERO[RCD_TIMER_WIDTH-1:0];
        else begin
          rcd_timer_ns = rcd_timer_r;
          if (start_rcd_lcl) rcd_timer_ns = nRCD_CLKS_M2[RCD_TIMER_WIDTH-1:0];
          else if (|rcd_timer_r) rcd_timer_ns =
                                   rcd_timer_r - ONE[RCD_TIMER_WIDTH-1:0];
        end
      end