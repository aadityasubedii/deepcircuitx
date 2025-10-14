generate
if ( DWIDTH == 32 &&( DATA_PATTERN == "DGEN_HAMMER" || DATA_PATTERN == "DGEN_ALL"))  begin : HAMMER_PATTERN_32
  always @ (posedge clk_i)