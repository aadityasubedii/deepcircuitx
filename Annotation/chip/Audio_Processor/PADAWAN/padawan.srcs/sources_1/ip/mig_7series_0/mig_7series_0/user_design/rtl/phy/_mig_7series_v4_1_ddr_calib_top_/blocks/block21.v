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
    