  always @(posedge clk)
    if (rst || (init_state_r == INIT_MPR_RDEN) || (init_state_r == INIT_OCAL_CENTER_ACT) ||
       (init_state_r == INIT_OCLKDELAY_ACT) || (init_state_r == INIT_RDLVL_ACT) || 
       (init_state_r == INIT_OCAL_COMPLEX_ACT) || (init_state_r ==INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT))
      num_refresh <= #TCQ 'd0;
    else if ((init_state_r == INIT_REFRESH) &&
             (~pi_dqs_found_done || ((DRAM_TYPE == "DDR3") && ~oclkdelay_calib_done) ||
             (rdlvl_stg1_done && ~prbs_rdlvl_done) ||
             (prbs_rdlvl_done && ~complex_oclkdelay_calib_done) ||
             ((CLK_PERIOD/nCK_PER_CLK <= 2500) && wrcal_done && ~rdlvl_stg1_done) ||
             ((CLK_PERIOD/nCK_PER_CLK > 2500) && wrlvl_done_r1 && ~rdlvl_stg1_done)))
      num_refresh <= #TCQ num_refresh + 1;