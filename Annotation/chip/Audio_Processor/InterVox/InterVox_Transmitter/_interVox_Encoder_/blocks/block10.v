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
  inBufr = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  inBufrPrev = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  trailing = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  rising = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  change = _RAND_4[0:0];
`endif 
  `endif 
end 