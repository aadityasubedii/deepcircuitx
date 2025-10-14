  generate
    if (DRAM_TYPE == "DDR3") begin : zq_cntrl
      reg zq_tick = 1'b0;
      if (ZQ_TIMER_DIV !=0) begin : zq_timer
        reg [ZQ_TIMER_WIDTH-1:0] zq_timer_r;
        reg [ZQ_TIMER_WIDTH-1:0] zq_timer_ns;