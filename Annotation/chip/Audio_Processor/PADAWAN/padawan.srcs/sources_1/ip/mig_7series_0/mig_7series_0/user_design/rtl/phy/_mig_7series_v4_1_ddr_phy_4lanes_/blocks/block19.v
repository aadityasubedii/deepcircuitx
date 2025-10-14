
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