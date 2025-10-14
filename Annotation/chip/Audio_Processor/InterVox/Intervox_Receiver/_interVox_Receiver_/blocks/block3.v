module interVox_Receiver(
  input         clock,
  input         reset,
  input         io_INTERVOX_IN,
  output        io_CLK_REC,
  output        io_DATA_OUT,
  output        io_CLK_DBUG,
  output        io_DBUG,
  output        io_DBUG1,
  output [15:0] io_LED,
  input  [15:0] io_SW,
  output        io_BCLK,
  output        io_LRCLK,
  output        io_SDATA,
  input         io_BTN_C,
  input         io_BTN_D,
  input         io_BTN_L,
  input         io_BTN_R
);
  wire  clockRec_clock; 
  wire  clockRec_reset; 
  wire  clockRec_io_DATA_IN; 
  wire  clockRec_io_CLK_OUT; 
  wire  clockRec_io_DATA_OUT; 
  wire  clockRec_io_DBUG; 
  wire  clockRec_io_DBUG1; 
  wire [15:0] clockRec_io_LED; 
  wire [15:0] clockRec_io_SW; 
  wire [63:0] clockRec_io_DATAREG; 
  wire  clockRec_io_BTN_C; 
  wire  i2sTrans_clock; 
  wire  i2sTrans_reset; 
  wire  i2sTrans_io_CLK_IN; 
  wire [63:0] i2sTrans_io_DATA_IN; 
  wire  i2sTrans_io_NEXT; 
  wire  i2sTrans_io_LRCLK; 
  wire  i2sTrans_io_SDATA; 
  clock_Recovery clockRec ( 
    .clock(clockRec_clock),
    .reset(clockRec_reset),
    .io_DATA_IN(clockRec_io_DATA_IN),
    .io_CLK_OUT(clockRec_io_CLK_OUT),
    .io_DATA_OUT(clockRec_io_DATA_OUT),
    .io_DBUG(clockRec_io_DBUG),
    .io_DBUG1(clockRec_io_DBUG1),
    .io_LED(clockRec_io_LED),
    .io_SW(clockRec_io_SW),
    .io_DATAREG(clockRec_io_DATAREG),
    .io_BTN_C(clockRec_io_BTN_C)
  );
  i2s_Transmitter i2sTrans ( 
    .clock(i2sTrans_clock),
    .reset(i2sTrans_reset),
    .io_CLK_IN(i2sTrans_io_CLK_IN),
    .io_DATA_IN(i2sTrans_io_DATA_IN),
    .io_NEXT(i2sTrans_io_NEXT),
    .io_LRCLK(i2sTrans_io_LRCLK),
    .io_SDATA(i2sTrans_io_SDATA)
  );
  assign io_CLK_REC = 1'h0; 
  assign io_DATA_OUT = clockRec_io_DATA_OUT; 
  assign io_CLK_DBUG = 1'h0; 
  assign io_DBUG = clockRec_io_DBUG; 
  assign io_DBUG1 = clockRec_io_DBUG1; 
  assign io_LED = clockRec_io_LED; 
  assign io_BCLK = clockRec_io_CLK_OUT; 
  assign io_LRCLK = i2sTrans_io_LRCLK; 
  assign io_SDATA = i2sTrans_io_SDATA; 
  assign clockRec_clock = clock;
  assign clockRec_reset = reset;
  assign clockRec_io_DATA_IN = io_INTERVOX_IN; 
  assign clockRec_io_SW = io_SW; 
  assign clockRec_io_BTN_C = io_BTN_C; 
  assign i2sTrans_clock = clock;
  assign i2sTrans_reset = reset;
  assign i2sTrans_io_CLK_IN = clockRec_io_CLK_OUT; 
  assign i2sTrans_io_DATA_IN = clockRec_io_DATAREG; 
  assign i2sTrans_io_NEXT = clockRec_io_DBUG1; 
endmodule