  output [1:0] match;
  assign match = complex_oclkdelay_calib_start ? {&prbs180_masked, &prbs0_masked} : {&comp180_masked , &comp0_masked};