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
  outReg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  stereoData = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  dspData = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  bitCntr_enc = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  hasNone = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  dataIndex = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  ndexR = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  enabled = _RAND_7[0:0];
`endif 
  `endif 
end 