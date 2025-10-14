        always @(init_calib_complete or maint_prescaler_tick_r_lcl
                 or zq_tick or zq_timer_r) begin
          zq_timer_ns = zq_timer_r;
          if (~init_calib_complete || zq_tick)
                zq_timer_ns = ZQ_TIMER_DIV[ZQ_TIMER_WIDTH-1:0];
          else if (|zq_timer_r && maint_prescaler_tick_r_lcl)
                   zq_timer_ns = zq_timer_r - ONE[ZQ_TIMER_WIDTH-1:0];
        end