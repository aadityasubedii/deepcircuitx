  assign BFR1_clock = clock;
  assign BFR1_io_write = 2'h0 == currentState ? 1'h0 : _GEN_75; 
  assign BFR1_io_dataIn = 2'h0 == currentState ? BFR_io_dataOut : _GEN_76; 
  assign biPhaseEncoder_clock = clock;