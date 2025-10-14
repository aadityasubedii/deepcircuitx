  generate
    if ((WRLVL == "ON") && (SKIP_CALIB == "FALSE")) begin: mb_wrlvl_inst

      mig_7series_v4_1_ddr_phy_wrlvl #
        (
         .TCQ               (TCQ),
         .DQS_CNT_WIDTH     (DQS_CNT_WIDTH),
         .DQ_WIDTH          (DQ_WIDTH),
         .DQS_WIDTH         (DQS_WIDTH),
         .DRAM_WIDTH        (DRAM_WIDTH),
         .RANKS             (1),
         .CLK_PERIOD        (CLK_PERIOD),
         .nCK_PER_CLK       (nCK_PER_CLK),
         .SIM_CAL_OPTION    (SIM_CAL_OPTION)
         )
        u_ddr_phy_wrlvl
          (
           .clk                         (clk),
           .rst                         (rst),
           .phy_ctl_ready               (phy_ctl_ready),
           .wr_level_start              (wrlvl_start),
           .wl_sm_start                 (wl_sm_start),
           .wrlvl_byte_redo             (wrlvl_byte_redo),
           .wrcal_cnt                   (po_stg2_wrcal_cnt),
           .early1_data                 (early1_data),
           .early2_data                 (early2_data),
           .wrlvl_final                 (wrlvl_final_mux),
           .oclkdelay_calib_cnt         (oclkdelay_calib_cnt),
           .wrlvl_byte_done             (wrlvl_byte_done),
           .oclkdelay_calib_done        (oclkdelay_calib_done),
           .rd_data_rise0               (phy_rddata[DQ_WIDTH-1:0]),
           .dqs_po_dec_done             (dqs_po_dec_done),
           .phy_ctl_rdy_dly             (phy_ctl_rdy_dly),
           .wr_level_done               (wrlvl_done),
           .wrlvl_rank_done             (wrlvl_rank_done),
           .done_dqs_tap_inc            (done_dqs_tap_inc),
           .dqs_po_stg2_f_incdec        (dqs_po_stg2_f_incdec),
           .dqs_po_en_stg2_f            (dqs_po_en_stg2_f),
           .dqs_wl_po_stg2_c_incdec     (dqs_wl_po_stg2_c_incdec),
           .dqs_wl_po_en_stg2_c         (dqs_wl_po_en_stg2_c),
           .po_counter_read_val         (po_counter_read_val),
           .po_stg2_wl_cnt              (po_stg2_wl_cnt),
           .wrlvl_err                   (wrlvl_err),
           .wl_po_coarse_cnt            (wl_po_coarse_cnt),
           .wl_po_fine_cnt              (wl_po_fine_cnt),
           .dbg_wl_tap_cnt              (dbg_tap_cnt_during_wrlvl),
           .dbg_wl_edge_detect_valid    (dbg_wl_edge_detect_valid),
           .dbg_rd_data_edge_detect     (dbg_rd_data_edge_detect),
           .dbg_dqs_count               (),
           .dbg_wl_state                (),
           .dbg_wrlvl_fine_tap_cnt      (dbg_wrlvl_fine_tap_cnt),
           .dbg_wrlvl_coarse_tap_cnt    (dbg_wrlvl_coarse_tap_cnt),
           .dbg_phy_wrlvl               (dbg_phy_wrlvl)
           );


        mig_7series_v4_1_ddr_phy_ck_addr_cmd_delay #
         (
          .TCQ           (TCQ),
          .tCK           (tCK),
          .DQS_CNT_WIDTH (DQS_CNT_WIDTH),
          .N_CTL_LANES   (N_CTL_LANES),
          .SIM_CAL_OPTION(SIM_CAL_OPTION)
          )
          u_ddr_phy_ck_addr_cmd_delay
            (
             .clk                        (clk),
             .rst                        (rst),
             .cmd_delay_start            (dqs_po_dec_done & pi_fine_dly_dec_done),
             .ctl_lane_cnt               (ctl_lane_cnt),
             .po_stg2_f_incdec           (cmd_po_stg2_f_incdec),
             .po_en_stg2_f               (cmd_po_en_stg2_f),
             .po_stg2_c_incdec           (cmd_po_stg2_c_incdec),
             .po_en_stg2_c               (cmd_po_en_stg2_c),
             .po_ck_addr_cmd_delay_done  (po_ck_addr_cmd_delay_done)
            );

      assign cmd_po_stg2_incdec_ddr2_c = 1'b0;
      assign cmd_po_en_stg2_ddr2_c = 1'b0;

    end else if ((WRLVL == "ON") && (SKIP_CALIB == "TRUE")) begin: wrlvl_on_skip_calib

        mig_7series_v4_1_ddr_phy_ck_addr_cmd_delay #
         (
          .TCQ           (TCQ),
          .tCK           (tCK),
          .DQS_CNT_WIDTH (DQS_CNT_WIDTH),
          .N_CTL_LANES   (N_CTL_LANES),
          .SIM_CAL_OPTION(SIM_CAL_OPTION)
          )
          u_ddr_phy_ck_addr_cmd_delay
            (
             .clk                        (clk),
             .rst                        (rst),
             .cmd_delay_start            (skip_cal_po_pi_dec_done),
             .ctl_lane_cnt               (ctl_lane_cnt),
             .po_stg2_f_incdec           (cmd_po_stg2_f_incdec),
             .po_en_stg2_f               (cmd_po_en_stg2_f),
             .po_stg2_c_incdec           (cmd_po_stg2_c_incdec),
             .po_en_stg2_c               (cmd_po_en_stg2_c),
             .po_ck_addr_cmd_delay_done  (po_ck_addr_cmd_delay_done)
            );

      assign dqs_po_dec_done             = 1'b1;
      assign wrlvl_byte_done             = 1'b1;
      assign wrlvl_rank_done             = 1'b1;
      assign phy_ctl_rdy_dly             = 1'b1;
      assign done_dqs_tap_inc            = 1'b1;
      assign po_stg2_wl_cnt              = 'h0;
      assign wl_po_coarse_cnt            = 'h0;
      assign wl_po_fine_cnt              = 'h0;
      assign dbg_tap_cnt_during_wrlvl    = 'h0;
      assign dbg_wl_edge_detect_valid    = 'h0;
      assign dbg_rd_data_edge_detect     = 'h0;
      assign dbg_wrlvl_fine_tap_cnt      = 'h0;
      assign dbg_wrlvl_coarse_tap_cnt    = 'h0;
      assign dbg_phy_wrlvl               = 'h0;

      assign wrlvl_done   = 1'b1;
      assign wrlvl_err    = 1'b0;
      assign dqs_po_stg2_f_incdec = 1'b0;
      assign dqs_po_en_stg2_f = 1'b0;
      assign dqs_wl_po_en_stg2_c = 1'b0;
      assign dqs_wl_po_stg2_c_incdec = 1'b0;

      assign cmd_po_stg2_incdec_ddr2_c = 1'b0;
      assign cmd_po_en_stg2_ddr2_c = 1'b0;

    end else begin: mb_wrlvl_off

        mig_7series_v4_1_ddr_phy_wrlvl_off_delay #
         (
          .TCQ           (TCQ),
          .tCK           (tCK),
          .nCK_PER_CLK   (nCK_PER_CLK),
          .CLK_PERIOD    (CLK_PERIOD),
          .PO_INITIAL_DLY(60),
          .DQS_CNT_WIDTH (DQS_CNT_WIDTH),
          .DQS_WIDTH     (DQS_WIDTH),
          .N_CTL_LANES   (N_CTL_LANES)
          )
          u_phy_wrlvl_off_delay
            (
             .clk                        (clk),
             .rst                        (rst),
             .pi_fine_dly_dec_done       (pi_fine_dly_dec_done),
             .cmd_delay_start            (phy_ctl_ready),
             .ctl_lane_cnt               (ctl_lane_cnt),
             .po_s2_incdec_f             (cmd_po_stg2_f_incdec),
             .po_en_s2_f                 (cmd_po_en_stg2_f),
             .po_s2_incdec_c             (cmd_po_stg2_incdec_ddr2_c),
             .po_en_s2_c                 (cmd_po_en_stg2_ddr2_c),
             .po_ck_addr_cmd_delay_done  (po_ck_addr_cmd_delay_done),
             .po_dec_done                (dqs_po_dec_done),
             .phy_ctl_rdy_dly            (phy_ctl_rdy_dly)
            );

      assign wrlvl_byte_done             = 1'b1;
      assign wrlvl_rank_done             = 1'b1;
      assign po_stg2_wl_cnt              = 'h0;
      assign wl_po_coarse_cnt            = 'h0;
      assign wl_po_fine_cnt              = 'h0;
      assign dbg_tap_cnt_during_wrlvl    = 'h0;
      assign dbg_wl_edge_detect_valid    = 'h0;
      assign dbg_rd_data_edge_detect     = 'h0;
      assign dbg_wrlvl_fine_tap_cnt      = 'h0;
      assign dbg_wrlvl_coarse_tap_cnt    = 'h0;
      assign dbg_phy_wrlvl               = 'h0;

      assign wrlvl_done   = 1'b1;
      assign wrlvl_err    = 1'b0;
      assign dqs_po_stg2_f_incdec = 1'b0;
      assign dqs_po_en_stg2_f = 1'b0;
      assign dqs_wl_po_en_stg2_c = 1'b0;
      assign cmd_po_stg2_c_incdec = 1'b0;
      assign dqs_wl_po_stg2_c_incdec = 1'b0;
      assign cmd_po_en_stg2_c = 1'b0;

    end
  endgenerate