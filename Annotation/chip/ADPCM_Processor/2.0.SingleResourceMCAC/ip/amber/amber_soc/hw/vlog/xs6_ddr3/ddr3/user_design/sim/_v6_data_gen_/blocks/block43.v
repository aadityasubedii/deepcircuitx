  generate
    if ((NUM_DQ_PINS == 56 ) && (DATA_PATTERN == "DGEN_NEIGHBOR" || DATA_PATTERN == "DGEN_WALKING1" || DATA_PATTERN == "DGEN_WALKING0" || DATA_PATTERN == "DGEN_ALL"))  begin : WALKING_ONE_56_PATTERN
      always @ (posedge clk_i) begin
