      always @(posedge clk) maint_prescaler_tick_r_lcl <=
                             #TCQ maint_prescaler_tick_ns;
    end