      begin : zq_request_logic
        wire zq_clears_zq_request = insert_maint_r1 && maint_zq_r_lcl;
        reg zq_request_r;
        wire zq_request_ns = ~rst && (DRAM_TYPE == "DDR3") &&
                           ((~init_calib_complete && (ZQ_TIMER_DIV != 0)) ||
                            (zq_request_r && ~zq_clears_zq_request) ||
                            zq_tick ||
                            (app_zq_req && init_calib_complete));