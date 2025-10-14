module i2s_Transmitter(
  input         clock,
  input         reset,
  input         io_CLK_IN,
  input  [63:0] io_DATA_IN,
  input         io_NEXT,
  output        io_LRCLK,
  output        io_SDATA
);