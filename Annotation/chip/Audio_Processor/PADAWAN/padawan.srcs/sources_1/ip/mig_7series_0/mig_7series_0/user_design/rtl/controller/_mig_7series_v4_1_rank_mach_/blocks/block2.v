  generate
    for (ID=0; ID<RANKS; ID=ID+1) begin:rank_cntrl
      mig_7series_v4_1_rank_cntrl #
        (
         
         .BURST_MODE                    (BURST_MODE),
         .ID                            (ID),
         .nBANK_MACHS                   (nBANK_MACHS),
         .nCK_PER_CLK                   (nCK_PER_CLK),
         .CL                            (CL),
         .CWL                           (CWL),
         .DQRD2DQWR_DLY                 (DQRD2DQWR_DLY),
         .nFAW                          (nFAW),
         .nREFRESH_BANK                 (nREFRESH_BANK),
         .nRRD                          (nRRD),
         .nWTR                          (nWTR),
         .PERIODIC_RD_TIMER_DIV         (PERIODIC_RD_TIMER_DIV),
         .RANK_BM_BV_WIDTH              (RANK_BM_BV_WIDTH),
         .RANK_WIDTH                    (RANK_WIDTH),
         .RANKS                         (RANKS),
         .REFRESH_TIMER_DIV             (REFRESH_TIMER_DIV))
        rank_cntrl0 
          (.clear_periodic_rd_request   (clear_periodic_rd_request[ID]),
           .inhbt_act_faw_r             (inhbt_act_faw_r[ID]),
           .inhbt_rd                    (inhbt_rd[ID]),
           .inhbt_wr                    (inhbt_wr[ID]),
           .periodic_rd_request         (periodic_rd_request[ID]),
           .refresh_request             (refresh_request[ID]),
           
           
           .clk                         (clk),
           .rst                         (rst),
           .col_rd_wr                   (col_rd_wr),
           .sending_row                 (sending_row[nBANK_MACHS-1:0]),
           .act_this_rank_r             (act_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
           .sending_col                 (sending_col[nBANK_MACHS-1:0]),
           .wr_this_rank_r              (wr_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
           .app_ref_req                 (app_ref_req),
           .init_calib_complete         (init_calib_complete),
           .rank_busy_r                 (rank_busy_r[(RANKS*nBANK_MACHS)-1:0]),
           .refresh_tick                (refresh_tick),
           .insert_maint_r1             (insert_maint_r1),
           .maint_zq_r                  (maint_zq_r),
           .maint_sre_r                 (maint_sre_r),
           .maint_srx_r                 (maint_srx_r),
           .maint_rank_r                (maint_rank_r[RANK_WIDTH-1:0]),
           .app_periodic_rd_req         (app_periodic_rd_req),
           .maint_prescaler_tick_r      (maint_prescaler_tick_r),
           .rd_this_rank_r              (rd_this_rank_r[RANK_BM_BV_WIDTH-1:0]));
    end
  endgenerate