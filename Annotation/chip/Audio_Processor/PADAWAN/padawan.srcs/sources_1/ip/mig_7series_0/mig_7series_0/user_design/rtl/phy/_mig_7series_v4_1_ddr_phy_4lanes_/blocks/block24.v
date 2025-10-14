generate

  if (BYTE_LANES[0]) begin
      assign dummy_data[0]             = 0;
  end
  else begin
      assign dummy_data[0]      = &phy_dout_remap[1*80-1:0*80];
  end
  if (BYTE_LANES[1]) begin
      assign dummy_data[1]             = 0;
  end
  else begin
      assign dummy_data[1]      = &phy_dout_remap[2*80-1:1*80];
  end
  if (BYTE_LANES[2]) begin
      assign dummy_data[2]             = 0;
  end
  else begin
      assign dummy_data[2]       = &phy_dout_remap[3*80-1:2*80];
  end
  if (BYTE_LANES[3]) begin
      assign dummy_data[3]             = 0;
  end
  else begin
      assign dummy_data[3]       = &phy_dout_remap[4*80-1:3*80];
  end

  if (PRESENT_DATA_A) begin
      assign A_of_data_full     = A_of_full;
      assign A_of_ctl_full      = 0;
      assign A_of_data_a_full   = A_of_a_full;
      assign A_of_ctl_a_full    = 0;
      assign A_pre_data_a_full  = A_pre_fifo_a_full;
  end
  else  begin
      assign A_of_ctl_full      = A_of_full;
      assign A_of_data_full     = 0;
      assign A_of_ctl_a_full    = A_of_a_full;
      assign A_of_data_a_full   = 0;
      assign A_pre_data_a_full  = 0;
  end
  if (PRESENT_DATA_B) begin
      assign B_of_data_full     = B_of_full;
      assign B_of_ctl_full      = 0;
      assign B_of_data_a_full   = B_of_a_full;
      assign B_of_ctl_a_full    = 0;
      assign B_pre_data_a_full  = B_pre_fifo_a_full;
  end
  else  begin
      assign B_of_ctl_full      = B_of_full;
      assign B_of_data_full     = 0;
      assign B_of_ctl_a_full    = B_of_a_full;
      assign B_of_data_a_full   = 0;
      assign B_pre_data_a_full  = 0;
  end
  if (PRESENT_DATA_C) begin
      assign C_of_data_full     = C_of_full;
      assign C_of_ctl_full      = 0;
      assign C_of_data_a_full   = C_of_a_full;
      assign C_of_ctl_a_full    = 0;
      assign C_pre_data_a_full  = C_pre_fifo_a_full;
  end
  else  begin
      assign C_of_ctl_full       = C_of_full;
      assign C_of_data_full      = 0;
      assign C_of_ctl_a_full     = C_of_a_full;
      assign C_of_data_a_full    = 0;
      assign C_pre_data_a_full    = 0;
  end
  if (PRESENT_DATA_D) begin
      assign D_of_data_full      = D_of_full;
      assign D_of_ctl_full       = 0;
      assign D_of_data_a_full    = D_of_a_full;
      assign D_of_ctl_a_full     = 0;
      assign D_pre_data_a_full   = D_pre_fifo_a_full;
  end
  else  begin
      assign D_of_ctl_full       = D_of_full;
      assign D_of_data_full      = 0;
      assign D_of_ctl_a_full     = D_of_a_full;
      assign D_of_data_a_full    = 0;
      assign D_pre_data_a_full   = 0;
  end

  if (PRESENT_DATA_A )
      case ( LANE_REMAP[1:0]   )
      2'b00 : assign phy_din[1*80-1:0]   = phy_din_remap[79:0];
      2'b01 : assign phy_din[2*80-1:80]  = phy_din_remap[79:0];
      2'b10 : assign phy_din[3*80-1:160] = phy_din_remap[79:0];
      2'b11 : assign phy_din[4*80-1:240] = phy_din_remap[79:0];
      endcase
  else
      case ( LANE_REMAP[1:0]   )
      2'b00 : assign phy_din[1*80-1:0]   = 80'h0;
      2'b01 : assign phy_din[2*80-1:80]  = 80'h0;
      2'b10 : assign phy_din[3*80-1:160] = 80'h0;
      2'b11 : assign phy_din[4*80-1:240] = 80'h0;
      endcase

  if (PRESENT_DATA_B )
      case ( LANE_REMAP[5:4]  )
      2'b00 : assign phy_din[1*80-1:0]   = phy_din_remap[159:80];
      2'b01 : assign phy_din[2*80-1:80]  = phy_din_remap[159:80];
      2'b10 : assign phy_din[3*80-1:160] = phy_din_remap[159:80];
      2'b11 : assign phy_din[4*80-1:240] = phy_din_remap[159:80];
      endcase
   else
     if (HIGHEST_LANE > 1)
        case ( LANE_REMAP[5:4]   )
        2'b00 : assign phy_din[1*80-1:0]   = 80'h0;
        2'b01 : assign phy_din[2*80-1:80]  = 80'h0;
        2'b10 : assign phy_din[3*80-1:160] = 80'h0;
        2'b11 : assign phy_din[4*80-1:240] = 80'h0;
        endcase

  if (PRESENT_DATA_C)
      case ( LANE_REMAP[9:8]  )
      2'b00 : assign phy_din[1*80-1:0]   = phy_din_remap[239:160];
      2'b01 : assign phy_din[2*80-1:80]  = phy_din_remap[239:160];
      2'b10 : assign phy_din[3*80-1:160] = phy_din_remap[239:160];
      2'b11 : assign phy_din[4*80-1:240] = phy_din_remap[239:160];
      endcase
  else
     if (HIGHEST_LANE > 2)
        case ( LANE_REMAP[9:8]   )
        2'b00 : assign phy_din[1*80-1:0]   = 80'h0;
        2'b01 : assign phy_din[2*80-1:80]  = 80'h0;
        2'b10 : assign phy_din[3*80-1:160] = 80'h0;
        2'b11 : assign phy_din[4*80-1:240] = 80'h0;
        endcase

  if (PRESENT_DATA_D )
      case ( LANE_REMAP[13:12]  )
      2'b00 : assign phy_din[1*80-1:0]   = phy_din_remap[319:240];
      2'b01 : assign phy_din[2*80-1:80]  = phy_din_remap[319:240];
      2'b10 : assign phy_din[3*80-1:160] = phy_din_remap[319:240];
      2'b11 : assign phy_din[4*80-1:240] = phy_din_remap[319:240];
      endcase
  else
     if (HIGHEST_LANE > 3)
        case ( LANE_REMAP[13:12]   )
        2'b00 : assign phy_din[1*80-1:0]   = 80'h0;
        2'b01 : assign phy_din[2*80-1:80]  = 80'h0;
        2'b10 : assign phy_din[3*80-1:160] = 80'h0;
        2'b11 : assign phy_din[4*80-1:240] = 80'h0;
      endcase

if (HIGHEST_LANE > 1)
 assign _phy_ctl_wd = {phy_ctl_wd[31:23], data_offset, phy_ctl_wd[16:0]};
if (HIGHEST_LANE == 1)
 assign _phy_ctl_wd = phy_ctl_wd;



BUFIO rclk_buf(.I(rclk_), .O(rclk) );

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

if ( BYTE_LANES[1] ) begin : ddr_byte_lane_B

  assign phy_dout_remap[159:80] = part_select_80(phy_dout, (LANE_REMAP[5:4]));
  mig_7series_v4_1_ddr_byte_lane #
    (
     .ABCD                   ("B"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[1] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[23:12]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[23:12]),
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
     .PI_BURST_MODE          (B_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (B_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (B_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (B_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (B_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (B_PI_SYNC_IN_DIV_RST),
     .PI_SEL_CLK_OFFSET      (PI_SEL_CLK_OFFSET),
     .PO_CLKOUT_DIV          (B_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (B_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (B_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (B_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (B_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (B_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (B_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (B_PO_SYNC_IN_DIV_RST),
     .OSERDES_DATA_RATE      (B_OS_DATA_RATE),
     .OSERDES_DATA_WIDTH     (B_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (B_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (B_IDELAYE2_IDELAY_VALUE)
     ,.CKE_ODT_AUX                   (CKE_ODT_AUX)
     ,.PI_DIV2_INCDEC        (PI_DIV2_INCDEC)
     )
   ddr_byte_lane_B(
      .mem_dq_out            (mem_dq_out[23:12]),
      .mem_dq_ts             (mem_dq_ts[23:12]),
      .mem_dq_in             (mem_dq_in[19:10]),
      .mem_dqs_out           (mem_dqs_out[1]),
      .mem_dqs_ts            (mem_dqs_ts[1]),
      .mem_dqs_in            (mem_dqs_in[1]),
      .rst                   (B_rst_primitives),
      .rst_pi_div2           (B_pi_rst_div2),
      .phy_clk               (phy_clk),
      .clk_div2              (clk_div2),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (B_ddr_clk),
      .rclk                  (B_rclk),
      .pi_dqs_found          (B_pi_dqs_found),
      .dqs_out_of_range      (B_pi_dqs_out_of_range),
      .if_empty_def          (if_empty_def),
      .if_a_empty            (B_if_a_empty),
      .if_empty              (B_if_empty),
      .if_a_full             (),
      .if_full               (),
      .of_a_empty            (),
      .of_empty              (),
      .of_a_full             (B_of_a_full),
      .of_full               (B_of_full),
      .pre_fifo_a_full       (B_pre_fifo_a_full),
      .phy_din               (phy_din_remap[159:80]),
      .phy_dout              (phy_dout_remap[159:80]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
      .if_rst                (if_rst),
      .byte_rd_en_oth_lanes  ({A_byte_rd_en,C_byte_rd_en,D_byte_rd_en}),
      .byte_rd_en_oth_banks  (byte_rd_en_oth_banks),
      .byte_rd_en            (B_byte_rd_en),

      .idelay_inc            (idelay_inc),
      .idelay_ce             (B_idelay_ce),
      .idelay_ld             (B_idelay_ld),
      .pi_rst_dqs_find       (B_pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (B_po_fine_enable),
      .po_coarse_enable      (B_po_coarse_enable),
      .po_fine_inc           (B_po_fine_inc),
      .po_coarse_inc         (B_po_coarse_inc),
      .po_counter_load_en    (B_po_counter_load_en),
      .po_counter_read_en    (B_po_counter_read_en),
      .po_counter_load_val   (B_po_counter_load_val),
      .po_coarse_overflow    (B_po_coarse_overflow),
      .po_fine_overflow      (B_po_fine_overflow),
      .po_counter_read_val   (B_po_counter_read_val),
      .po_sel_fine_oclk_delay(B_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (B_pi_fine_enable),
      .pi_fine_inc           (B_pi_fine_inc),
      .pi_counter_load_en    (B_pi_counter_load_en),
      .pi_counter_read_en    (B_pi_counter_read_en),
      .pi_counter_load_val   (B_pi_counter_load_val),
      .pi_fine_overflow      (B_pi_fine_overflow),
      .pi_counter_read_val   (B_pi_counter_read_val),
      .pi_iserdes_rst        (B_pi_iserdes_rst),
      .pi_phase_locked       (B_pi_phase_locked),
      .fine_delay            (B_fine_delay),
      .fine_delay_sel        (B_fine_delay_sel)
);
end
else begin : no_ddr_byte_lane_B
       assign B_of_a_full           = 1'b0;
       assign B_of_full             = 1'b0;
       assign B_pre_fifo_a_full     = 1'b0;
       assign B_if_empty            = 1'b0;
       assign B_if_a_empty          = 1'b0;
       assign B_byte_rd_en          = 1'b1;
       assign B_pi_phase_locked     = 1;
       assign B_pi_dqs_found        = 1;
       assign B_rclk                = 0;
       assign B_ddr_clk             = {LP_DDR_CK_WIDTH*6{1'b0}};
       assign B_pi_counter_read_val = 0;
       assign B_po_counter_read_val = 0;
       assign B_pi_fine_overflow    = 0;
       assign B_po_coarse_overflow  = 0;
       assign B_po_fine_overflow    = 0;
end

if ( BYTE_LANES[2] ) begin : ddr_byte_lane_C

  assign phy_dout_remap[239:160] = part_select_80(phy_dout, (LANE_REMAP[9:8]));
  mig_7series_v4_1_ddr_byte_lane #
    (
     .ABCD                   ("C"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[2] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[35:24]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[35:24]),
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
     .PI_BURST_MODE          (C_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (C_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (C_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (C_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (C_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (C_PI_SYNC_IN_DIV_RST),
     .PI_SEL_CLK_OFFSET      (PI_SEL_CLK_OFFSET),
     .PO_CLKOUT_DIV          (C_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (C_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (C_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (C_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (C_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (C_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (C_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (C_PO_SYNC_IN_DIV_RST),
     .OSERDES_DATA_RATE      (C_OS_DATA_RATE),
     .OSERDES_DATA_WIDTH     (C_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (C_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (C_IDELAYE2_IDELAY_VALUE)
     ,.CKE_ODT_AUX                   (CKE_ODT_AUX)
     ,.PI_DIV2_INCDEC        (PI_DIV2_INCDEC)
     )
   ddr_byte_lane_C(
      .mem_dq_out            (mem_dq_out[35:24]),
      .mem_dq_ts             (mem_dq_ts[35:24]),
      .mem_dq_in             (mem_dq_in[29:20]),
      .mem_dqs_out           (mem_dqs_out[2]),
      .mem_dqs_ts            (mem_dqs_ts[2]),
      .mem_dqs_in            (mem_dqs_in[2]),
      .rst                   (C_rst_primitives),
      .rst_pi_div2           (C_pi_rst_div2),
      .phy_clk               (phy_clk),
      .clk_div2              (clk_div2),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (C_ddr_clk),
      .rclk                  (C_rclk),
      .pi_dqs_found          (C_pi_dqs_found),
      .dqs_out_of_range      (C_pi_dqs_out_of_range),
      .if_empty_def          (if_empty_def),
      .if_a_empty            (C_if_a_empty),
      .if_empty              (C_if_empty),
      .if_a_full             (),
      .if_full               (),
      .of_a_empty            (),
      .of_empty              (),
      .of_a_full             (C_of_a_full),
      .of_full               (C_of_full),
      .pre_fifo_a_full       (C_pre_fifo_a_full),
      .phy_din               (phy_din_remap[239:160]),
      .phy_dout              (phy_dout_remap[239:160]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
      .if_rst                (if_rst),
      .byte_rd_en_oth_lanes  ({A_byte_rd_en,B_byte_rd_en,D_byte_rd_en}),
      .byte_rd_en_oth_banks  (byte_rd_en_oth_banks),
      .byte_rd_en            (C_byte_rd_en),

      .idelay_inc            (idelay_inc),
      .idelay_ce             (C_idelay_ce),
      .idelay_ld             (C_idelay_ld),
      .pi_rst_dqs_find       (C_pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (C_po_fine_enable),
      .po_coarse_enable      (C_po_coarse_enable),
      .po_fine_inc           (C_po_fine_inc),
      .po_coarse_inc         (C_po_coarse_inc),
      .po_counter_load_en    (C_po_counter_load_en),
      .po_counter_read_en    (C_po_counter_read_en),
      .po_counter_load_val   (C_po_counter_load_val),
      .po_coarse_overflow    (C_po_coarse_overflow),
      .po_fine_overflow      (C_po_fine_overflow),
      .po_counter_read_val   (C_po_counter_read_val),
      .po_sel_fine_oclk_delay(C_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (C_pi_fine_enable),
      .pi_fine_inc           (C_pi_fine_inc),
      .pi_counter_load_en    (C_pi_counter_load_en),
      .pi_counter_read_en    (C_pi_counter_read_en),
      .pi_counter_load_val   (C_pi_counter_load_val),
      .pi_fine_overflow      (C_pi_fine_overflow),
      .pi_counter_read_val   (C_pi_counter_read_val),
      .pi_iserdes_rst        (C_pi_iserdes_rst),
      .pi_phase_locked       (C_pi_phase_locked),
      .fine_delay            (C_fine_delay),
      .fine_delay_sel        (C_fine_delay_sel)
);

end
else begin : no_ddr_byte_lane_C
       assign C_of_a_full           = 1'b0;
       assign C_of_full             = 1'b0;
       assign C_pre_fifo_a_full     = 1'b0;
       assign C_if_empty            = 1'b0;
       assign C_byte_rd_en          = 1'b1;
       assign C_if_a_empty          = 1'b0;
       assign C_pi_phase_locked     = 1;
       assign C_pi_dqs_found        = 1;
       assign C_rclk                = 0;
       assign C_ddr_clk             = {LP_DDR_CK_WIDTH*6{1'b0}};
       assign C_pi_counter_read_val = 0;
       assign C_po_counter_read_val = 0;
       assign C_pi_fine_overflow    = 0;
       assign C_po_coarse_overflow  = 0;
       assign C_po_fine_overflow    = 0;
end

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
endgenerate