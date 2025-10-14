  always @(posedge clk)
    if (rst || 
        ((stg1_wr_rd_cnt == 'd2) && ~stg1_wr_done) || prbs_rdlvl_done)                        
      prbs_gen_clk_en <= #TCQ 1'b0;
    else if ((~phy_if_empty_r && rdlvl_stg1_done_r1 && ~prbs_rdlvl_done) ||
             ((init_state_r == INIT_RDLVL_ACT_WAIT) && rdlvl_stg1_done_r1 && (cnt_cmd_r == 'd127)) ||
             ((init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT) && rdlvl_stg1_done_r1 && (complex_wait_cnt == 'd14)) 
             || (init_state_r == INIT_RDLVL_COMPLEX_READ) || ((init_state_r == INIT_PRECHARGE_PREWAIT) && prbs_rdlvl_start)) 
      prbs_gen_clk_en <= #TCQ 1'b1;