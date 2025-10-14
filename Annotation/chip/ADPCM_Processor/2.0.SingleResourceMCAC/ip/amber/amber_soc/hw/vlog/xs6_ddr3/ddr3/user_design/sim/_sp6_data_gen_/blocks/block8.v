generate
if ( DWIDTH == 64 && (DATA_PATTERN == "DGEN_HAMMER" || DATA_PATTERN == "DGEN_ALL"))  begin : HAMMER_PATTERN_64
  always @ (posedge clk_i)