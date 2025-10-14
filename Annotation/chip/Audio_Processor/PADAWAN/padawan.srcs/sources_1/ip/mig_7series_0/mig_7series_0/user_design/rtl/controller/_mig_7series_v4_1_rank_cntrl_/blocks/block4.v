      always @(init_calib_complete or maint_prescaler_tick_r
               or periodic_rd_timer_r or int_read_this_rank) begin
        periodic_rd_timer_ns = periodic_rd_timer_r;
        if (~init_calib_complete)
          periodic_rd_timer_ns = PERIODIC_RD_TIMER_DIV[0+:PERIODIC_RD_TIMER_WIDTH];
          
        else if (int_read_this_rank || periodic_rd_timer_one)
                periodic_rd_timer_ns =
                   PERIODIC_RD_TIMER_DIV[0+:PERIODIC_RD_TIMER_WIDTH];
             else if (|periodic_rd_timer_r && maint_prescaler_tick_r)
                 periodic_rd_timer_ns =
                   periodic_rd_timer_r - ONE[0+:PERIODIC_RD_TIMER_WIDTH];
      end