      always @(posedge clk) refresh_timer_r <= #TCQ refresh_timer_ns;
      assign refresh_tick_lcl = (refresh_timer_r ==
                  ONE[REFRESH_TIMER_WIDTH-1:0]) && maint_prescaler_tick_r_lcl;
    end