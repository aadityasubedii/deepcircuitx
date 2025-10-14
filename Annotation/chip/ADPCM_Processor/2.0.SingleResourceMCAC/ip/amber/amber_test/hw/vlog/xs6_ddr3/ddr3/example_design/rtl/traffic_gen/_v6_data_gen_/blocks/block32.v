  generate
    if ((NUM_DQ_PINS == 104 ) && (DATA_PATTERN == "DGEN_NEIGHBOR" || DATA_PATTERN == "DGEN_WALKING1" || DATA_PATTERN == "DGEN_WALKING0" || DATA_PATTERN == "DGEN_ALL"))  begin : WALKING_ONE_104_PATTERN
      always @ (posedge clk_i) begin