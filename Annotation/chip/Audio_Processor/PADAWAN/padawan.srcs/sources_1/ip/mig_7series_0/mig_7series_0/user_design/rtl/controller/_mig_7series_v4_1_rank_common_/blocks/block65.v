      always @(init_calib_complete or maint_prescaler_r
               or maint_prescaler_tick_ns) begin
        maint_prescaler_ns = maint_prescaler_r;
        if (~init_calib_complete || maint_prescaler_tick_ns)
           maint_prescaler_ns = MAINT_PRESCALER_DIV[MAINT_PRESCALER_WIDTH-1:0];
        else if (|maint_prescaler_r)
       maint_prescaler_ns = maint_prescaler_r - ONE[MAINT_PRESCALER_WIDTH-1:0];
      end