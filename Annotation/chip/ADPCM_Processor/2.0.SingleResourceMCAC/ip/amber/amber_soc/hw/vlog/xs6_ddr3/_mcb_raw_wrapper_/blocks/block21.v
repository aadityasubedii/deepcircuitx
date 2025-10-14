OSERDES2 #(
  .BYPASS_GCLK_FF ("TRUE"),
  .DATA_RATE_OQ  (C_OSERDES2_DATA_RATE_OQ),         
  .DATA_RATE_OT  (C_OSERDES2_DATA_RATE_OT),         
  .OUTPUT_MODE   (C_OSERDES2_OUTPUT_MODE_SE),          
  .SERDES_MODE   (C_OSERDES2_SERDES_MODE_MASTER),          
  .DATA_WIDTH    (2)           
) ioi_ck_0 
(
  .OQ       (ioi_ck),
  .SHIFTOUT1(),
  .SHIFTOUT2(),
  .SHIFTOUT3(),
  .SHIFTOUT4(),
  .TQ       (t_ck),
  .CLK0     (ioclk0),
  .CLK1(1'b0),
  .CLKDIV(1'b0),
  .D1       (1'b0),
  .D2       (1'b1),
  .D3(1'b0),
  .D4(1'b0),
  .IOCE     (pll_ce_0),
  .OCE      (pll_lock),

  .RST      (1'b0),
  .SHIFTIN1(1'b0),
  .SHIFTIN2(1'b0),
  .SHIFTIN3 (1'b0),
  .SHIFTIN4 (1'b0),
  .T1(1'b0),
  .T2(1'b0),
  .T3(1'b0),
  .T4(1'b0),
  .TCE(1'b1),
  .TRAIN    (1'b0)
);