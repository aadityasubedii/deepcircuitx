initial begin
  if ( SYNTHESIS == "FALSE" ) begin
  $display("%m : BYTE_LANES_B0 = %x BYTE_LANES_B1 = %x DATA_CTL_B0 = %x DATA_CTL_B1 = %x", BYTE_LANES_B0, BYTE_LANES_B1, DATA_CTL_B0, DATA_CTL_B1);
  $display("%m : HIGHEST_LANE = %d HIGHEST_LANE_B0 = %d HIGHEST_LANE_B1 = %d",  HIGHEST_LANE, HIGHEST_LANE_B0, HIGHEST_LANE_B1);
  $display("%m : HIGHEST_BANK = %d", HIGHEST_BANK);

  $display("%m : FREQ_REF_PERIOD         = %0.2f ", FREQ_REF_PERIOD);
  $display("%m : DDR_TCK                 = %0d ", DDR_TCK);
  $display("%m : PO_S2_TAPS_SIZE         = %0.2f ", PO_S2_TAPS_SIZE);
  $display("%m : PO_CIRC_BUF_EARLY       = %0d ", PO_CIRC_BUF_EARLY);
  $display("%m : PO_CIRC_BUF_OFFSET      = %0.2f ", PO_CIRC_BUF_OFFSET);
  $display("%m : PO_CIRC_BUF_META_ZONE   = %0.2f ", PO_CIRC_BUF_META_ZONE);
  $display("%m : PO_STG2_FINE_INTR_DLY   = %0.2f ", PO_STG2_FINE_INTRINSIC_DELAY);
  $display("%m : PO_STG2_COARSE_INTR_DLY = %0.2f ", PO_STG2_COARSE_INTRINSIC_DELAY);
  $display("%m : PO_STG2_INTRINSIC_DELAY = %0.2f ", PO_STG2_INTRINSIC_DELAY);
  $display("%m : PO_CIRC_BUF_DELAY       = %0d ", PO_CIRC_BUF_DELAY);
  $display("%m : PO_INTRINSIC_DELAY      = %0.2f ", PO_INTRINSIC_DELAY);
  $display("%m : PO_DELAY                = %0.2f ", PO_DELAY);
  $display("%m : PO_OCLK_DELAY           = %0d ", PHY_0_A_PO_OCLK_DELAY);
  $display("%m : L_PHY_0_PO_FINE_DELAY   = %0d ", L_PHY_0_PO_FINE_DELAY);

  $display("%m : PI_STG1_INTRINSIC_DELAY = %0.2f ", PI_STG1_INTRINSIC_DELAY);
  $display("%m : PI_STG2_INTRINSIC_DELAY = %0.2f ", PI_STG2_INTRINSIC_DELAY);
  $display("%m : PI_INTRINSIC_DELAY      = %0.2f ", PI_INTRINSIC_DELAY);
  $display("%m : PI_MAX_STG2_DELAY       = %0.2f ", PI_MAX_STG2_DELAY);
  $display("%m : PI_OFFSET               = %0.2f ", PI_OFFSET);
  if ( PI_OFFSET < 0) $display("%m : a negative PI_OFFSET means that rclk path is longer than oclk path so rclk will be delayed to next oclk edge and the negedge of rclk may be used.");
  $display("%m : PI_STG2_DELAY           = %0.2f ", PI_STG2_DELAY);
  $display("%m :PI_STG2_DELAY_CAND       = %0.2f ",PI_STG2_DELAY_CAND);
  $display("%m : DEFAULT_RCLK_DELAY      = %0d ", DEFAULT_RCLK_DELAY);
  $display("%m : RCLK_SELECT_EDGE        = %0b ", LP_RCLK_SELECT_EDGE);
  end 
  if ( PI_STG2_DELAY_CAND > PI_MAX_STG2_DELAY) $display("WARNING: %m: The required delay though the phaser_in to internally match the aux_out clock  to ddr clock exceeds the maximum allowable delay. The clock edge  will occur at the output registers of aux_out %0.2f ps before the ddr clock  edge. If aux_out is used for memory inputs, this may violate setup or hold time.", PI_STG2_DELAY_CAND - PI_MAX_STG2_DELAY);
end