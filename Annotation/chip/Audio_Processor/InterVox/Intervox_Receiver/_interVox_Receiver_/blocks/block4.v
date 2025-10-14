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
  bitCntrTrans = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  lrclk = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sdataO = _RAND_2[0:0];
`endif 
  `endif 
end 