  generate 
    if ( tCK <= 2500 ) begin : check_ocal_timing
      localparam CLK_PERIOD_PS = MMCM_VCO_PERIOD * MMCM_MULT_F;
      localparam integer CLK_PERIOD_PS_DIV4 = CLK_PERIOD_PS/4;

      time rising_mmcm_ps_clk;