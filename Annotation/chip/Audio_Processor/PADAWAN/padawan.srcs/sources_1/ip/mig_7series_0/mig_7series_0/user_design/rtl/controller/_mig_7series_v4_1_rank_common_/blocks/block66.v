  generate
    begin : maint_prescaler
      reg [MAINT_PRESCALER_WIDTH-1:0] maint_prescaler_r;
      reg [MAINT_PRESCALER_WIDTH-1:0] maint_prescaler_ns;
      wire maint_prescaler_tick_ns =
             (maint_prescaler_r == ONE[MAINT_PRESCALER_WIDTH-1:0]);