  assign i2sTrans_clock = clock;
  assign i2sTrans_reset = reset;
  assign i2sTrans_io_CLK_IN = clockRec_io_CLK_OUT; 
  assign i2sTrans_io_DATA_IN = clockRec_io_DATAREG; 
  assign i2sTrans_io_NEXT = clockRec_io_DBUG1; 