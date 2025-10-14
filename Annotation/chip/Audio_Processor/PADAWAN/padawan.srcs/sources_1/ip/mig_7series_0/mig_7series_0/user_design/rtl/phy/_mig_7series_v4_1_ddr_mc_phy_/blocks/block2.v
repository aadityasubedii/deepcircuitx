generate





if ( BYTE_LANES_B1 == 0 && BYTE_LANES_B2 == 0 && RCLK_SELECT_BANK>0)
begin : phaser_in_rclk

localparam L_EXTRA_PI_FINE_DELAY = DEFAULT_RCLK_DELAY;

PHASER_IN_PHY #(
  .BURST_MODE                       ( PHY_0_A_BURST_MODE),
  .CLKOUT_DIV                       ( PHY_0_A_PI_CLKOUT_DIV),
  .FREQ_REF_DIV                     ( PHY_0_A_PI_FREQ_REF_DIV),
  .REFCLK_PERIOD                    ( L_FREQ_REF_PERIOD_NS),
  .FINE_DELAY                       ( L_EXTRA_PI_FINE_DELAY),
  .OUTPUT_CLK_SRC                   ( RCLK_PI_OUTPUT_CLK_SRC)
) phaser_in_rclk (
  .DQSFOUND                         (),
  .DQSOUTOFRANGE                    (),
  .FINEOVERFLOW                     (),
  .PHASELOCKED                      (),
  .ISERDESRST                       (),
  .ICLKDIV                          (),
  .ICLK                             (),
  .COUNTERREADVAL                   (),
  .RCLK                             (),
  .WRENABLE                         (),
  .BURSTPENDINGPHY                  (),
  .ENCALIBPHY                       (),
  .FINEENABLE                       (0),
  .FREQREFCLK                       (freq_refclk),
  .MEMREFCLK                        (mem_refclk),
  .RANKSELPHY                       (0),
  .PHASEREFCLK                      (),
  .RSTDQSFIND                       (0),
  .RST                              (rst),
  .FINEINC                          (),
  .COUNTERLOADEN                    (),
  .COUNTERREADEN                    (),
  .COUNTERLOADVAL                   (),
  .SYNCIN                           (sync_pulse),
  .SYSCLK                           (phy_clk)
);

end

endgenerate