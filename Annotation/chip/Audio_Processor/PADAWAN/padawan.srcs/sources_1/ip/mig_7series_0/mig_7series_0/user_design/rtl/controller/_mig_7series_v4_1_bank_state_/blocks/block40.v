  assign precharge_bm_end = (rp_timer_r == ONE[RP_TIMER_WIDTH-1:0]) ||
                            (start_pre && (nRP_CLKS_M2 == ZERO));