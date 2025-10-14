initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  lastOne = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  leds = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  inBufr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  deltaCntr = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  bitCntr = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  clkRec = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  change = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  dataOut = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  syncWord = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  zeroFlipped = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  syncFlipped = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  syncFlipped1 = _RAND_11[0:0];
`endif 
  `endif 
end 