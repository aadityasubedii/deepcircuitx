if ( BYTE_LANES[0] ) begin : ddr_byte_lane_A

  assign phy_dout_remap[79:0] = part_select_80(phy_dout, (LANE_REMAP[1:0]));

  mig_7series_v4_1_ddr_byte_lane #
    (
     .ABCD                   ("A"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[0] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[11:0]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[11:0]),
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
     .PI_BURST_MODE          (A_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (A_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (A_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (A_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (A_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (A_PI_SYNC_IN_DIV_RST),
     .PI_SEL_CLK_OFFSET      (PI_SEL_CLK_OFFSET),
     .PO_CLKOUT_DIV          (A_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (A_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (A_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (A_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (A_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (A_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (A_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (A_PO_SYNC_IN_DIV_RST),
     .OSERDES_DATA_RATE      (A_OS_DATA_RATE),
     .OSERDES_DATA_WIDTH     (A_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (A_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (A_IDELAYE2_IDELAY_VALUE)
     ,.CKE_ODT_AUX                   (CKE_ODT_AUX)
     ,.PI_DIV2_INCDEC        (PI_DIV2_INCDEC)
     )
   ddr_byte_lane_A(
      .mem_dq_out            (mem_dq_out[11:0]),
      .mem_dq_ts             (mem_dq_ts[11:0]),
      .mem_dq_in             (mem_dq_in[9:0]),
      .mem_dqs_out           (mem_dqs_out[0]),
      .mem_dqs_ts            (mem_dqs_ts[0]),
      .mem_dqs_in            (mem_dqs_in[0]),
      .rst                   (A_rst_primitives),
      .rst_pi_div2           (A_pi_rst_div2),
      .phy_clk               (phy_clk),
      .clk_div2              (clk_div2),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (A_ddr_clk),
      .rclk                  (A_rclk),
      .pi_dqs_found          (A_pi_dqs_found),
      .dqs_out_of_range      (A_pi_dqs_out_of_range),
      .if_empty_def          (if_empty_def),
      .if_a_empty            (A_if_a_empty),
      .if_empty              (A_if_empty),
      .if_a_full             (),
      .if_full               (),
      .of_a_empty            (),
      .of_empty              (),
      .of_a_full             (A_of_a_full),
      .of_full               (A_of_full),
      .pre_fifo_a_full       (A_pre_fifo_a_full),
      .phy_din               (phy_din_remap[79:0]),
      .phy_dout              (phy_dout_remap[79:0]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
      .if_rst                (if_rst),
      .byte_rd_en_oth_lanes  ({B_byte_rd_en,C_byte_rd_en,D_byte_rd_en}),
      .byte_rd_en_oth_banks  (byte_rd_en_oth_banks),
      .byte_rd_en            (A_byte_rd_en),

      .idelay_inc            (idelay_inc),
      .idelay_ce             (A_idelay_ce),
      .idelay_ld             (A_idelay_ld),
      .pi_rst_dqs_find       (A_pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (A_po_fine_enable),
      .po_coarse_enable      (A_po_coarse_enable),
      .po_fine_inc           (A_po_fine_inc),
      .po_coarse_inc         (A_po_coarse_inc),
      .po_counter_load_en    (A_po_counter_load_en),
      .po_counter_read_en    (A_po_counter_read_en),
      .po_counter_load_val   (A_po_counter_load_val),
      .po_coarse_overflow    (A_po_coarse_overflow),
      .po_fine_overflow      (A_po_fine_overflow),
      .po_counter_read_val   (A_po_counter_read_val),
      .po_sel_fine_oclk_delay(A_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (A_pi_fine_enable),
      .pi_fine_inc           (A_pi_fine_inc),
      .pi_counter_load_en    (A_pi_counter_load_en),
      .pi_counter_read_en    (A_pi_counter_read_en),
      .pi_counter_load_val   (A_pi_counter_load_val),
      .pi_fine_overflow      (A_pi_fine_overflow),
      .pi_counter_read_val   (A_pi_counter_read_val),
      .pi_iserdes_rst        (A_pi_iserdes_rst),
      .pi_phase_locked       (A_pi_phase_locked),
      .fine_delay            (A_fine_delay),
      .fine_delay_sel        (A_fine_delay_sel)
);

end
else begin : no_ddr_byte_lane_A
       assign A_of_a_full           = 1'b0;
       assign A_of_full             = 1'b0;
       assign A_pre_fifo_a_full     = 1'b0;
       assign A_if_empty            = 1'b0;
       assign A_byte_rd_en          = 1'b1;
       assign A_if_a_empty          = 1'b0;
       assign A_pi_phase_locked     = 1;
       assign A_pi_dqs_found        = 1;
       assign A_rclk                = 0;
       assign A_ddr_clk             = {LP_DDR_CK_WIDTH*6{1'b0}};
       assign A_pi_counter_read_val = 0;
       assign A_po_counter_read_val = 0;
       assign A_pi_fine_overflow    = 0;
       assign A_po_coarse_overflow  = 0;
       assign A_po_fine_overflow    = 0;
end