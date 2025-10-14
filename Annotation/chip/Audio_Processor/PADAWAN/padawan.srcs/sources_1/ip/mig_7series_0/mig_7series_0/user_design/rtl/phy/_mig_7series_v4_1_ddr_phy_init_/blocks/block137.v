  always @(posedge clk)
    if (rst)
      mem_init_done_r <= #TCQ 1'b0;
    else if ((!cnt_dllk_zqinit_done_r && 
             (cnt_dllk_zqinit_r == TDLLK_TZQINIT_DELAY_CNT) &&
             (chip_cnt_r == RANKS-1) && (DRAM_TYPE == "DDR3"))
              || ( (init_state_r == INIT_LOAD_MR_WAIT) &&
             (ddr2_refresh_flag_r) && (chip_cnt_r == RANKS-1)
             && (cnt_init_mr_done_r) && (DRAM_TYPE == "DDR2")))
      mem_init_done_r <= #TCQ 1'b1;