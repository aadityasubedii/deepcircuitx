  localparam nRP_CLKS_M2 = (nRP_CLKS-2 < 0) ? 0 : nRP_CLKS-2;
  localparam RP_TIMER_WIDTH = clogb2(nRP_CLKS_M2 + 1);