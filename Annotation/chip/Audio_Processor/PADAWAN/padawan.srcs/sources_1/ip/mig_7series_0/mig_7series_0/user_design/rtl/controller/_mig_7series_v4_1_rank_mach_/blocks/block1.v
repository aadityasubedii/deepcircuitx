  mig_7series_v4_1_rank_common #
    (
     
     .DRAM_TYPE                         (DRAM_TYPE),
     .MAINT_PRESCALER_DIV               (MAINT_PRESCALER_DIV),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCKESR                            (nCKESR),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .PERIODIC_RD_TIMER_DIV             (PERIODIC_RD_TIMER_DIV),
     .RANK_WIDTH                        (RANK_WIDTH),
     .RANKS                             (RANKS),
     .REFRESH_TIMER_DIV                 (REFRESH_TIMER_DIV),
     .ZQ_TIMER_DIV                      (ZQ_TIMER_DIV))
    rank_common0
    (.clear_periodic_rd_request         (clear_periodic_rd_request[RANKS-1:0]),
     
     
     .maint_prescaler_tick_r            (maint_prescaler_tick_r),
     .refresh_tick                      (refresh_tick),
     .maint_zq_r                        (maint_zq_r),
     .maint_sre_r                       (maint_sre_r),
     .maint_srx_r                       (maint_srx_r),
     .maint_req_r                       (maint_req_r),
     .maint_rank_r                      (maint_rank_r[RANK_WIDTH-1:0]),
     .maint_ref_zq_wip                  (maint_ref_zq_wip),
     .periodic_rd_r                     (periodic_rd_r),
     .periodic_rd_rank_r                (periodic_rd_rank_r[RANK_WIDTH-1:0]),
     
     .clk                               (clk),
     .rst                               (rst),
     .init_calib_complete               (init_calib_complete),
     .app_ref_req                       (app_ref_req),
     .app_ref_ack                       (app_ref_ack),
     .app_zq_req                        (app_zq_req),
     .app_zq_ack                        (app_zq_ack),
     .app_sr_req                        (app_sr_req),
     .app_sr_active                     (app_sr_active),
     .insert_maint_r1                   (insert_maint_r1),
     .refresh_request                   (refresh_request[RANKS-1:0]),
     .maint_wip_r                       (maint_wip_r),
     .slot_0_present                    (slot_0_present[7:0]),
     .slot_1_present                    (slot_1_present[7:0]),
     .periodic_rd_request               (periodic_rd_request[RANKS-1:0]),
     .periodic_rd_ack_r                 (periodic_rd_ack_r));
