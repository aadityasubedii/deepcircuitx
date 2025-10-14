    always @(posedge clk)
      if (rst ||
         
         (rdlvl_stg1_done && prbs_rdlvl_done && ~wrcal_done && (SKIP_CALIB == "FALSE")) ||
         
         (wrlvl_done_r &&
         (init_state_r==INIT_WRLVL_LOAD_MR2_WAIT)))begin 
        chip_cnt_r <= #TCQ 2'b00;
      end else if ((((init_state_r == INIT_WAIT_DLLK_ZQINIT) &&
               (cnt_dllk_zqinit_r == TDLLK_TZQINIT_DELAY_CNT)) && 
               (DRAM_TYPE == "DDR3")) ||
               ((init_state_r==INIT_REFRESH_RNK2_WAIT) &&
               (cnt_cmd_r=='d36)) ||
               
               
               
               
               
               
               (~pi_dqs_found_all_r &&
               (init_state_r==INIT_PRECHARGE_PREWAIT) &&
               (cnt_cmd_r=='d36) && (SKIP_CALIB == "FALSE")) ||
               
               
               (pi_dqs_found_rank_done && ~pi_dqs_found_rank_done_r && (SKIP_CALIB == "FALSE")) ||
               ((init_state_r == INIT_LOAD_MR_WAIT)&& cnt_cmd_done_r 
               && wrcal_done) ||
               ((init_state_r == INIT_DDR2_MULTI_RANK)
                  && (DRAM_TYPE == "DDR2"))) begin
        if ((~mem_init_done_r || ~rdlvl_stg1_done || ~pi_dqs_found_done ||
            
            
           ~pi_calib_done_r || wrcal_done) 
           && (chip_cnt_r != RANKS-1)) 
          chip_cnt_r <= #TCQ chip_cnt_r + 1;
        else
          chip_cnt_r <= #TCQ 2'b00;
    end
  end