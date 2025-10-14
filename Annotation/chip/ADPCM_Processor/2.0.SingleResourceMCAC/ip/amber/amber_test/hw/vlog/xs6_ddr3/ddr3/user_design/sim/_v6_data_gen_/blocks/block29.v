  generate
    if((NUM_DQ_PINS == 112 ) && (DATA_PATTERN == "DGEN_NEIGHBOR" || DATA_PATTERN == "DGEN_WALKING1" || DATA_PATTERN == "DGEN_WALKING0" || DATA_PATTERN == "DGEN_ALL"))  begin : WALKING_ONE_112_PATTERN
      always @ (posedge clk_i) begin