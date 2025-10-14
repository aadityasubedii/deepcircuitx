  initial begin
    $display("############# MMCME2_ADV Parameters #############\n");
    $display("MMCM_MULT_F           = %d", MMCM_MULT_F);

    $display("MMCM_VCO_FREQ (MHz)   = %7.3f", MMCM_VCO*1.000);
    $display("MMCM_VCO_PERIOD       = %7.3f", MMCM_VCO_PERIOD);
    $display("#################################################\n");
  end