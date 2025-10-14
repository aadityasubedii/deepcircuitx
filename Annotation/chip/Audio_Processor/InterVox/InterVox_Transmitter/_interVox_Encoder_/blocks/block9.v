  assign io_MCLK_O = clock; 
  assign io_DATA_O = biPhaseEncoder_io_DATA_OUT; 
  assign io_LRCLK_O = io_LRCLK_IN; 
  assign io_BCLK_O = io_BCLK_IN; 
  assign io_SDATA_O = io_SDATA_IN; 
  assign io_NXT_FRAME = BCLKEDGE_io_CHANGE; 
  assign io_LED = leds; 
  assign BFR_clock = clock;