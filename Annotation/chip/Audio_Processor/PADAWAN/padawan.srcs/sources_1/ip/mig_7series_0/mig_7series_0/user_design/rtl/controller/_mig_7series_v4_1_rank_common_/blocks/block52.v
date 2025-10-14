        always @(maint_prescaler_tick_r_lcl or zq_timer_r)
                  zq_tick = (zq_timer_r ==
                       ONE[ZQ_TIMER_WIDTH-1:0] && maint_prescaler_tick_r_lcl);
      end 