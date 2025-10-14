module edgeDetector(
  input   clock,
  input   reset,
  input   io_INPUT,
  output  io_TRAIL,
  output  io_RISE,
  output  io_CHANGE
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif 
  reg [1:0] inBufr; 