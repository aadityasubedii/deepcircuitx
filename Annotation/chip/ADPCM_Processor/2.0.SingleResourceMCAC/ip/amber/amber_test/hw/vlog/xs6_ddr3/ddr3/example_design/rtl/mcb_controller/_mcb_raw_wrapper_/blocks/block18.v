generate
      for(dq = 0; dq < C_NUM_DQ_PINS; dq = dq + 1) begin : gen_dq

OSERDES2 #(
  .BYPASS_GCLK_FF ("TRUE"),
  .DATA_RATE_OQ  (C_OSERDES2_DATA_RATE_OQ),         
  .DATA_RATE_OT  (C_OSERDES2_DATA_RATE_OT),         
  .OUTPUT_MODE   (C_OSERDES2_OUTPUT_MODE_SE),          
  .SERDES_MODE   (C_OSERDES2_SERDES_MODE_MASTER),          
  .DATA_WIDTH    (2),           
  .TRAIN_PATTERN (5)            
) oserdes2_dq_0 
(
  .OQ       (dq_oq[dq]),
  .SHIFTOUT1 (),
  .SHIFTOUT2 (),
  .SHIFTOUT3 (),
  .SHIFTOUT4 (),
  .TQ       (dq_tq[dq]),
  .CLK0     (ioclk90),
  .CLK1 (1'b0),
  .CLKDIV (1'b0),
  .D1       (dqo_p[dq]),
  .D2       (dqo_n[dq]),
  .D3 (1'b0),
  .D4 (1'b0),
  .IOCE     (pll_ce_90),
  .OCE      (1'b1),
  .RST      (int_sys_rst),
  .SHIFTIN1 (1'b0),
  .SHIFTIN2 (1'b0),
  .SHIFTIN3 (1'b0),
  .SHIFTIN4 (1'b0),
  .T1       (dqIO_w_en_0),
  .T2       (dqIO_w_en_0),
  .T3 (1'b0),
  .T4 (1'b0),
  .TCE      (1'b1),
  .TRAIN    (ioi_drp_train)
);

end