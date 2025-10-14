generate
  if(PRBS_CMD == "INSTR" | PRBS_CMD == "BLEN") begin :gen20_taps
    always @(posedge clk_i) begin