      begin : ckesr_timer
        
        reg [CKESR_TIMER_WIDTH-1:0] ckesr_timer_r = {CKESR_TIMER_WIDTH{1'b0}};
        reg [CKESR_TIMER_WIDTH-1:0] ckesr_timer_ns = {CKESR_TIMER_WIDTH{1'b0}};
        