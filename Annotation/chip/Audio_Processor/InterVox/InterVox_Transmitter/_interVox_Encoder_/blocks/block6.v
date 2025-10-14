  assign biPhaseEncoder_reset = reset;
  assign biPhaseEncoder_io_AUDIOINPUT = BFR1_io_dataOut; 
  assign biPhaseEncoder_io_DSPINPUT = {{48'd0}, dspData}; 
  assign biPhaseEncoder_io_ENA = biPhaseEna; 
  assign biPhaseEncoder_io_CLK = BCLKEDGE_io_CHANGE; 