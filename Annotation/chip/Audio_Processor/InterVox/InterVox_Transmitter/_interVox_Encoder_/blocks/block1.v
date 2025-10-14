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
  currentState = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  syncing = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  synced = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  biPhaseEna = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  leds = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  left = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  right = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  dspData = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  bitCntr = _RAND_8[7:0];
`endif 
  `endif 
end 