if ( BYTE_LANES[3] ) begin : ddr_byte_lane_D
  assign phy_dout_remap[319:240] = part_select_80(phy_dout, (LANE_REMAP[13:12]));

  mig_7series_v4_1_ddr_byte_lane #
    (
     .ABCD                   ("D"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[3] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[47:36]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[47:36]),
     .OF_ALMOST_EMPTY_VALUE  (OF_ALMOST_EMPTY_VALUE),
     .OF_ALMOST_FULL_VALUE   (OF_ALMOST_FULL_VALUE),
     .OF_SYNCHRONOUS_MODE    (OF_SYNCHRONOUS_MODE),
     
     
     
     .IF_ALMOST_EMPTY_VALUE  (IF_ALMOST_EMPTY_VALUE),
     .IF_ALMOST_FULL_VALUE   (IF_ALMOST_FULL_VALUE),
     .IF_SYNCHRONOUS_MODE    (IF_SYNCHRONOUS_MODE),
     .IODELAY_GRP            (IODELAY_GRP),
     .FPGA_SPEED_GRADE       (FPGA_SPEED_GRADE),
     .BANK_TYPE              (BANK_TYPE),
     .BYTELANES_DDR_CK       (BYTELANES_DDR_CK),
     .RCLK_SELECT_LANE       (RCLK_SELECT_LANE),
     .USE_PRE_POST_FIFO      (USE_PRE_POST_FIFO),
     .SYNTHESIS              (SYNTHESIS),
     .TCK                    (TCK),
     .PC_CLK_RATIO           (PC_CLK_RATIO),
     .PI_BURST_MODE          (D_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (D_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (D_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (D_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (D_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (D_PI_SYNC_IN_DIV_RST),
     .PI_SEL_CLK_OFFSET      (PI_SEL_CLK_OFFSET),
     .PO_CLKOUT_DIV          (D_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (D_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (D_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (D_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (D_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (D_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (D_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (D_PO_SYNC_IN_DIV_RST),
     .OSERDES_DATA_RATE      (D_OS_DATA_RATE),
     .OSERDES_DATA_WIDTH     (D_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (D_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (D_IDELAYE2_IDELAY_VALUE)
     ,.CKE_ODT_AUX                   (CKE_ODT_AUX)
     ,.PI_DIV2_INCDEC        (PI_DIV2_INCDEC)
     )
   ddr_byte_lane_D(
      .mem_dq_out            (mem_dq_out[47:36]),
      .mem_dq_ts             (mem_dq_ts[47:36]),
      .mem_dq_in             (mem_dq_in[39:30]),
      .mem_dqs_out           (mem_dqs_out[3]),
      .mem_dqs_ts            (mem_dqs_ts[3]),
      .mem_dqs_in            (mem_dqs_in[3]),
      .rst                   (D_rst_primitives),
      .rst_pi_div2           (D_pi_rst_div2),
      .phy_clk               (phy_clk),
      .clk_div2              (clk_div2),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (D_ddr_clk),
      .rclk                  (D_rclk),
      .pi_dqs_found          (D_pi_dqs_found),
      .dqs_out_of_range      (D_pi_dqs_out_of_range),
      .if_empty_def          (if_empty_def),
      .if_a_empty            (D_if_a_empty),
      .if_empty              (D_if_empty),
      .if_a_full             (),
      .if_full               (),
      .of_a_empty            (),
      .of_empty              (),
      .of_a_full             (D_of_a_full),
      .of_full               (D_of_full),
      .pre_fifo_a_full       (D_pre_fifo_a_full),
      .phy_din               (phy_din_remap[319:240]),
      .phy_dout              (phy_dout_remap[319:240]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
      .idelay_inc            (idelay_inc),
      .idelay_ce             (D_idelay_ce),
      .idelay_ld             (D_idelay_ld),
      .if_rst                (if_rst),
      .byte_rd_en_oth_lanes  ({A_byte_rd_en,B_byte_rd_en,C_byte_rd_en}),
      .byte_rd_en_oth_banks  (byte_rd_en_oth_banks),
      .byte_rd_en            (D_byte_rd_en),

      .pi_rst_dqs_find       (D_pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (D_po_fine_enable),
      .po_coarse_enable      (D_po_coarse_enable),
      .po_fine_inc           (D_po_fine_inc),
      .po_coarse_inc         (D_po_coarse_inc),
      .po_counter_load_en    (D_po_counter_load_en),
      .po_counter_read_en    (D_po_counter_read_en),
      .po_counter_load_val   (D_po_counter_load_val),
      .po_coarse_overflow    (D_po_coarse_overflow),
      .po_fine_overflow      (D_po_fine_overflow),
      .po_counter_read_val   (D_po_counter_read_val),
      .po_sel_fine_oclk_delay(D_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (D_pi_fine_enable),
      .pi_fine_inc           (D_pi_fine_inc),
      .pi_counter_load_en    (D_pi_counter_load_en),
      .pi_counter_read_en    (D_pi_counter_read_en),
      .pi_counter_load_val   (D_pi_counter_load_val),
      .pi_fine_overflow      (D_pi_fine_overflow),
      .pi_counter_read_val   (D_pi_counter_read_val),
      .pi_iserdes_rst        (D_pi_iserdes_rst),
      .pi_phase_locked       (D_pi_phase_locked),
      .fine_delay            (D_fine_delay),
      .fine_delay_sel        (D_fine_delay_sel)
);
end
else begin : no_ddr_byte_lane_D
       assign D_of_a_full           = 1'b0;
       assign D_of_full             = 1'b0;
       assign D_pre_fifo_a_full     = 1'b0;
       assign D_if_empty            = 1'b0;
       assign D_byte_rd_en          = 1'b1;
       assign D_if_a_empty          = 1'b0;
       assign D_rclk                = 0;
       assign D_ddr_clk             = {LP_DDR_CK_WIDTH*6{1'b0}};
       assign D_pi_dqs_found        = 1;
       assign D_pi_phase_locked     = 1;
       assign D_pi_counter_read_val = 0;
       assign D_po_counter_read_val = 0;
       assign D_pi_fine_overflow    = 0;
       assign D_po_coarse_overflow  = 0;
       assign D_po_fine_overflow    = 0;
end