  wire [RAS_TIMER_WIDTH-1:0] ras_timer_passed_ns = rcv_open_bank
                                                     ? passed_ras_timer
                                                     : ras_timer_ns;