generate

if ( PO_DATA_CTL == "TRUE" || ((RCLK_SELECT_LANE==ABCD) && (CKE_ODT_AUX =="TRUE")))  begin : phaser_in_gen


if (PI_DIV2_INCDEC == "TRUE") begin

PHASER_IN_PHY #(
  .BURST_MODE                       ( PI_BURST_MODE),
  .CLKOUT_DIV                       ( PI_CLKOUT_DIV),
  .DQS_AUTO_RECAL                   ( DQS_AUTO_RECAL),
  .DQS_FIND_PATTERN                 ( DQS_FIND_PATTERN),
  .SEL_CLK_OFFSET                   ( PI_SEL_CLK_OFFSET),
  .FINE_DELAY                       ( PI_FINE_DELAY),
  .FREQ_REF_DIV                     ( PI_FREQ_REF_DIV),
  .OUTPUT_CLK_SRC                   ( PI_OUTPUT_CLK_SRC),
  .SYNC_IN_DIV_RST                  ( PI_SYNC_IN_DIV_RST),
  .REFCLK_PERIOD                    ( L_FREQ_REF_PERIOD_NS),
  .MEMREFCLK_PERIOD                 ( L_MEM_REF_PERIOD_NS),
  .PHASEREFCLK_PERIOD               ( L_PHASE_REF_PERIOD_NS)
) phaser_in (
  .DQSFOUND                         (pi_dqs_found_w),
  .DQSOUTOFRANGE                    (dqs_out_of_range),
  .FINEOVERFLOW                     (pi_fine_overflow),
  .PHASELOCKED                      (pi_phase_locked_w),
  .ISERDESRST                       (pi_iserdes_rst),
  .ICLKDIV                          (iserdes_clkdiv),
  .ICLK                             (iserdes_clk),
  .COUNTERREADVAL                   (pi_counter_read_val_w),
  .RCLK                             (rclk),
  .WRENABLE                         (ififo_wr_enable),
  .BURSTPENDINGPHY                  (phaser_ctl_bus[MSB_BURST_PEND_PI - 3 + PHASER_INDEX]),
  .ENCALIBPHY                       (pi_en_calib),
  .FINEENABLE                       (pi_fine_enable),
  .FREQREFCLK                       (freq_refclk),
  .MEMREFCLK                        (mem_refclk),
  .RANKSELPHY                       (rank_sel_i),
  .PHASEREFCLK                      (dqs_to_phaser),
  .RSTDQSFIND                       (pi_rst_dqs_find),
  .RST                              (rst_pi_div2),
  .FINEINC                          (pi_fine_inc),
  .COUNTERLOADEN                    (pi_counter_load_en),
  .COUNTERREADEN                    (pi_counter_read_en),
  .COUNTERLOADVAL                   (pi_counter_load_val),
  .SYNCIN                           (sync_pulse),
  .SYSCLK                           (clk_div2)
);
end

else begin

PHASER_IN_PHY #(
  .BURST_MODE                       ( PI_BURST_MODE),
  .CLKOUT_DIV                       ( PI_CLKOUT_DIV),
  .DQS_AUTO_RECAL                   ( DQS_AUTO_RECAL),
  .DQS_FIND_PATTERN                 ( DQS_FIND_PATTERN),
  .SEL_CLK_OFFSET                   ( PI_SEL_CLK_OFFSET),
  .FINE_DELAY                       ( PI_FINE_DELAY),
  .FREQ_REF_DIV                     ( PI_FREQ_REF_DIV),
  .OUTPUT_CLK_SRC                   ( PI_OUTPUT_CLK_SRC),
  .SYNC_IN_DIV_RST                  ( PI_SYNC_IN_DIV_RST),
  .REFCLK_PERIOD                    ( L_FREQ_REF_PERIOD_NS),
  .MEMREFCLK_PERIOD                 ( L_MEM_REF_PERIOD_NS),
  .PHASEREFCLK_PERIOD               ( L_PHASE_REF_PERIOD_NS)
) phaser_in (
  .DQSFOUND                         (pi_dqs_found_w),
  .DQSOUTOFRANGE                    (dqs_out_of_range),
  .FINEOVERFLOW                     (pi_fine_overflow),
  .PHASELOCKED                      (pi_phase_locked_w),
  .ISERDESRST                       (pi_iserdes_rst),
  .ICLKDIV                          (iserdes_clkdiv),
  .ICLK                             (iserdes_clk),
  .COUNTERREADVAL                   (pi_counter_read_val_w),
  .RCLK                             (rclk),
  .WRENABLE                         (ififo_wr_enable),
  .BURSTPENDINGPHY                  (phaser_ctl_bus[MSB_BURST_PEND_PI - 3 + PHASER_INDEX]),
  .ENCALIBPHY                       (pi_en_calib),
  .FINEENABLE                       (pi_fine_enable),
  .FREQREFCLK                       (freq_refclk),
  .MEMREFCLK                        (mem_refclk),
  .RANKSELPHY                       (rank_sel_i),
  .PHASEREFCLK                      (dqs_to_phaser),
  .RSTDQSFIND                       (pi_rst_dqs_find),
  .RST                              (rst),
  .FINEINC                          (pi_fine_inc),
  .COUNTERLOADEN                    (pi_counter_load_en),
  .COUNTERREADEN                    (pi_counter_read_en),
  .COUNTERLOADVAL                   (pi_counter_load_val),
  .SYNCIN                           (sync_pulse),
  .SYSCLK                           (phy_clk)
);

end
end
else begin
   assign pi_dqs_found_w = 1'b1;

   assign pi_phase_locked_w = 1'b1;
end

endgenerate