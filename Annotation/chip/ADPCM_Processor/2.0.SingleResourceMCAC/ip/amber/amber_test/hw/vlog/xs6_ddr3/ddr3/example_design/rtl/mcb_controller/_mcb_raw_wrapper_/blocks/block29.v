   generate 
      for(addr_ioi = 0; addr_ioi < C_MEM_ADDR_WIDTH; addr_ioi = addr_ioi + 1) begin : gen_addr_oserdes2
OSERDES2 #(
  .BYPASS_GCLK_FF ("TRUE"),
  .DATA_RATE_OQ  (C_OSERDES2_DATA_RATE_OQ),         
  .DATA_RATE_OT  (C_OSERDES2_DATA_RATE_OT),         
  .OUTPUT_MODE   (C_OSERDES2_OUTPUT_MODE_SE),          
  .SERDES_MODE   (C_OSERDES2_SERDES_MODE_MASTER),          
  .DATA_WIDTH    (2)           
) ioi_addr_0  
(
  .OQ(ioi_addr[addr_ioi]),
  .SHIFTOUT1(),
  .SHIFTOUT2(),
  .SHIFTOUT3(),
  .SHIFTOUT4(),
  .TQ(t_addr[addr_ioi]),
  .CLK0(ioclk0),
  .CLK1(1'b0),
  .CLKDIV(1'b0),
  .D1(address_90[addr_ioi]),
  .D2(address_90[addr_ioi]),
  .D3(1'b0),
  .D4(1'b0),
  .IOCE(pll_ce_0),
  .OCE(1'b1),
  .RST(int_sys_rst),
  .SHIFTIN1(1'b0),
  .SHIFTIN2(1'b0),
  .SHIFTIN3(1'b0),
  .SHIFTIN4(1'b0),
  .T1(1'b0),
  .T2(1'b0),
  .T3(1'b0),
  .T4(1'b0),
  .TCE(1'b1),
  .TRAIN(1'b0)
    );
 end       
   endgenerate