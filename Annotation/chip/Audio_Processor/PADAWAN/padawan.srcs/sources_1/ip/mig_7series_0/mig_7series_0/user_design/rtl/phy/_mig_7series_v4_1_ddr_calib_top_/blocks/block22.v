   generate
   if((WRLVL == "ON") && (OCAL_EN == "ON")) begin: oclk_calib

     localparam SAMPCNTRWIDTH = 17;
     localparam SAMPLES = (SIM_CAL_OPTION=="NONE") ? 512 : 4; 
     localparam TAPCNTRWIDTH = clogb2(TAPSPERKCLK);
     localparam MMCM_SAMP_WAIT = (SIM_CAL_OPTION=="NONE") ? 256 : 10;
     localparam OCAL_SIMPLE_SCAN_SAMPS = (SIM_CAL_OPTION=="NONE") ? 512 : 1; 
     localparam POC_PCT_SAMPS_SOLID = 80;
     localparam SCAN_PCT_SAMPS_SOLID = 95;

     mig_7series_v4_1_ddr_phy_oclkdelay_cal #
       (
    
    .DQS_CNT_WIDTH      (DQS_CNT_WIDTH),
    .DQS_WIDTH          (DQS_WIDTH),
    .DQ_WIDTH           (DQ_WIDTH),
    
    .DRAM_WIDTH         (DRAM_WIDTH),
    
    .OCAL_SIMPLE_SCAN_SAMPS (OCAL_SIMPLE_SCAN_SAMPS),
    .PCT_SAMPS_SOLID                (POC_PCT_SAMPS_SOLID),
    .POC_USE_METASTABLE_SAMP        (POC_USE_METASTABLE_SAMP),
    .SCAN_PCT_SAMPS_SOLID           (SCAN_PCT_SAMPS_SOLID),
    .SAMPCNTRWIDTH      (SAMPCNTRWIDTH),
    .SAMPLES            (SAMPLES),
    .MMCM_SAMP_WAIT             (MMCM_SAMP_WAIT),
    .SIM_CAL_OPTION             (SIM_CAL_OPTION),
    .TAPCNTRWIDTH               (TAPCNTRWIDTH),
    .TAPSPERKCLK                (TAPSPERKCLK),
    .TCQ                (TCQ),
    .nCK_PER_CLK                (nCK_PER_CLK),
    .BYPASS_COMPLEX_OCAL        (BYPASS_COMPLEX_OCAL)
    
    )
     u_ddr_phy_oclkdelay_cal
       (
    
    .prbs_ignore_first_byte           (prbs_ignore_first_byte),
    .prbs_ignore_last_bytes           (prbs_ignore_last_bytes),
    .complex_oclkdelay_calib_done   (complex_oclkdelay_calib_done),
    .dbg_oclkdelay_rd_data          (dbg_oclkdelay_rd_data[16*DRAM_WIDTH-1:0]),
    .dbg_phy_oclkdelay_cal          (dbg_phy_oclkdelay_cal[255:0]),
    .lim2init_write_request         (lim2init_write_request),
    .lim_done                       (lim_done),
    .oclk_calib_resume              (oclk_calib_resume),
    .oclk_prech_req                 (oclk_prech_req),
    .oclkdelay_calib_cnt            (oclkdelay_calib_cnt[DQS_CNT_WIDTH:0]),
    .oclkdelay_calib_done           (oclkdelay_calib_done),
    .po_en_stg23                    (po_en_stg23),
    .po_stg23_incdec                (po_stg23_incdec),
    .po_stg23_sel                   (po_stg23_sel),
    .psen                           (psen),
    .psincdec                       (psincdec),
    .wrlvl_final                    (wrlvl_final),
    .rd_victim_sel                  (complex_ocal_rd_victim_sel),
    .ocal_num_samples_done_r        (complex_ocal_num_samples_done_r),
    .complex_wrlvl_final            (complex_wrlvl_final),
    .poc_error                      (poc_error),
    
    .clk                            (clk),
    .complex_oclkdelay_calib_start  (complex_oclkdelay_calib_start_w),
    .metaQ                          (pd_out),
    
    .po_counter_read_val            (po_counter_read_val),
    .oclkdelay_calib_start          (oclkdelay_calib_start),
    .oclkdelay_init_val             (oclkdelay_init_val[5:0]),
    .poc_sample_pd                  (poc_sample_pd),
    .phy_rddata                     (phy_rddata[2*nCK_PER_CLK*DQ_WIDTH-1:0]),
    .phy_rddata_en                  (phy_rddata_en),
    .prbs_o                         (prbs_o[2*nCK_PER_CLK*DQ_WIDTH-1:0]),
    .prech_done                     (prech_done),
    .psdone                         (psdone),
    .rst                            (rst),
    .wl_po_fine_cnt                 (wl_po_fine_cnt[6*DQS_WIDTH-1:0]),
    .ocal_num_samples_inc           (complex_ocal_num_samples_inc),
    .oclkdelay_center_calib_start   (oclkdelay_center_calib_start),
    .oclk_center_write_resume       (oclk_center_write_resume),
    .oclkdelay_center_calib_done    (oclkdelay_center_calib_done),
    .dbg_ocd_lim                    (dbg_ocd_lim),
    .dbg_poc                         (dbg_poc[1023:0]) );

     end else begin : oclk_calib_disabled

       assign   wrlvl_final = 'b0;
       assign   psen        = 'b0;
       assign   psincdec    = 'b0;
       assign   po_stg23_sel = 'b0;
       assign   po_stg23_incdec = 'b0;
       assign   po_en_stg23 = 'b0;
       assign   oclkdelay_calib_cnt = 'b0;
       assign   oclk_prech_req = 'b0;
       assign   oclk_calib_resume = 'b0;
       assign   oclkdelay_calib_done = 1'b1;
       assign   dbg_phy_oclkdelay_cal = 'h0;
       assign   dbg_oclkdelay_rd_data = 'h0;

     end
   endgenerate