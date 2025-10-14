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