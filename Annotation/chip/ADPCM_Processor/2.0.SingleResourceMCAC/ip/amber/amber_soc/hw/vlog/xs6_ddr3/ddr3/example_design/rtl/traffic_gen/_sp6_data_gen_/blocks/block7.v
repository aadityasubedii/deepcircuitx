generate
if ( DWIDTH == 128 && (DATA_PATTERN == "DGEN_HAMMER" || DATA_PATTERN == "DGEN_ALL"))  begin : HAMMER_PATTERN_128
  always @ (posedge clk_i)