      always @(init_calib_complete or maint_prescaler_tick_r_lcl
               or refresh_tick_lcl or refresh_timer_r) begin
        refresh_timer_ns = refresh_timer_r;
        if (~init_calib_complete || refresh_tick_lcl)
              refresh_timer_ns = REFRESH_TIMER_DIV[REFRESH_TIMER_WIDTH-1:0];
        else if (|refresh_timer_r && maint_prescaler_tick_r_lcl)
                 refresh_timer_ns =
                   refresh_timer_r - ONE[REFRESH_TIMER_WIDTH-1:0];
      end