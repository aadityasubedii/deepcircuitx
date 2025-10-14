  always @ (lfsr_q[PRBS_WIDTH:1]) begin
    prbs = lfsr_q[PRBS_WIDTH:1];
  end