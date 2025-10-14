generate
  if(PRBS_CMD == "ADDRESS" && PRBS_WIDTH == 64) begin :gen64_taps
    always @ (posedge clk_i) begin