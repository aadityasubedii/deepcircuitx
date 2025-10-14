  mig_7series_v4_1_ddr_phy_wrcal #
    (
     .TCQ            (TCQ),
     .nCK_PER_CLK    (nCK_PER_CLK),
     .CLK_PERIOD     (CLK_PERIOD),
     .DQ_WIDTH       (DQ_WIDTH),
     .DQS_CNT_WIDTH  (DQS_CNT_WIDTH),
     .DQS_WIDTH      (DQS_WIDTH),
     .DRAM_WIDTH     (DRAM_WIDTH),
     .SIM_CAL_OPTION (SIM_CAL_OPTION)
     )
    u_ddr_phy_wrcal
      (
       .clk                         (clk),
       .rst                         (rst),
       .wrcal_start                 (wrcal_start),
       .wrcal_rd_wait               (wrcal_rd_wait),
       .wrcal_sanity_chk            (wrcal_sanity_chk),
       .dqsfound_retry_done         (pi_dqs_found_done),
       .dqsfound_retry              (dqsfound_retry),
       .wrcal_read_req              (wrcal_read_req),
       .wrcal_act_req               (wrcal_act_req),
       .phy_rddata_en               (phy_rddata_en),
       .wrcal_done                  (wrcal_done),
       .wrcal_pat_err               (wrcal_pat_err),
       .wrcal_prech_req             (wrcal_prech_req),
       .temp_wrcal_done             (temp_wrcal_done),
       .wrcal_sanity_chk_done       (wrcal_sanity_chk_done),
       .prech_done                  (prech_done),
       .rd_data                     (phy_rddata),
       .wrcal_pat_resume            (wrcal_pat_resume),
       .po_stg2_wrcal_cnt           (po_stg2_wrcal_cnt),
       .phy_if_reset                (phy_if_reset_w),
       .wl_po_coarse_cnt            (wl_po_coarse_cnt),
       .wl_po_fine_cnt              (wl_po_fine_cnt),
       .wrlvl_byte_redo             (wrlvl_byte_redo),
       .wrlvl_byte_done             (wrlvl_byte_done),
       .early1_data                 (early1_data),
       .early2_data                 (early2_data),
       .idelay_ld                   (idelay_ld),
       .dbg_phy_wrcal               (dbg_phy_wrcal),
       .dbg_final_po_fine_tap_cnt   (dbg_final_po_fine_tap_cnt),
       .dbg_final_po_coarse_tap_cnt (dbg_final_po_coarse_tap_cnt)
   );