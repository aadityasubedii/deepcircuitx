module clock_Recovery(
  input         clock,
  input         reset,
  input         io_DATA_IN,
  output        io_CLK_OUT,
  output        io_DATA_OUT,
  output        io_DBUG,
  output        io_DBUG1,
  output [15:0] io_LED,
  input  [15:0] io_SW,
  output [63:0] io_DATAREG,
  input         io_BTN_C
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif 
  wire  BFR_clock; 
  wire  BFR_io_write; 
  wire [63:0] BFR_io_dataIn; 
  wire [63:0] BFR_io_dataOut; 
  wire  BFR1_clock; 
  wire  BFR1_io_write; 
  wire [63:0] BFR1_io_dataIn; 
  wire [63:0] BFR1_io_dataOut; 
  wire  CLKEDGE_clock; 
  wire  CLKEDGE_reset; 
  wire  CLKEDGE_io_INPUT; 
  wire  CLKEDGE_io_RISE; 
  reg [7:0] lastOne; 
  reg [15:0] leds; 
  reg [1:0] inBufr; 
  reg [7:0] deltaCntr; 
  reg [6:0] bitCntr; 
  reg  clkRec; 
  reg  change; 
  reg  dataOut; 
  reg  syncWord; 
  reg  zeroFlipped; 
  reg  syncFlipped; 
  reg  syncFlipped1; 
  wire [7:0] _deltaCntr_T_1 = deltaCntr + 8'h1; 
  wire [1:0] _inBufr_T_1 = inBufr + 2'h1; 
  wire [1:0] _inBufr_T_3 = inBufr - 2'h1; 
  wire  _GEN_4 = inBufr[0] ^ inBufr[1] | change; 
  wire  _clkRec_T = ~clkRec; 
  wire  _GEN_6 = change ? ~clkRec : clkRec; 
  wire  _GEN_8 = change ? 1'h0 : zeroFlipped; 
  wire  _GEN_9 = change ? 1'h0 : syncFlipped; 
  wire  _GEN_10 = change ? 1'h0 : syncFlipped1; 
  wire  _GEN_11 = syncWord ? 1'h0 : syncWord; 
  wire [6:0] _GEN_12 = syncWord ? 7'h0 : bitCntr; 
  wire [6:0] _bitCntr_T_1 = bitCntr + 7'h1; 
  wire [6:0] _BFR_io_dataIn_T_1 = 7'h3f - bitCntr; 
  wire [127:0] _BFR_io_dataIn_T_2 = 128'h1 << _BFR_io_dataIn_T_1; 
  wire [127:0] _GEN_47 = {{64'd0}, BFR_io_dataOut}; 
  wire [127:0] _BFR_io_dataIn_T_3 = _GEN_47 | _BFR_io_dataIn_T_2; 
  wire [127:0] _BFR_io_dataIn_T_6 = 128'h0 << _BFR_io_dataIn_T_1; 
  wire [127:0] _BFR_io_dataIn_T_7 = _GEN_47 & _BFR_io_dataIn_T_6; 
  wire [127:0] _GEN_15 = dataOut ? _BFR_io_dataIn_T_3 : _BFR_io_dataIn_T_7; 
  wire [6:0] _GEN_16 = CLKEDGE_io_RISE ? _bitCntr_T_1 : _GEN_12; 
  wire [127:0] _GEN_18 = CLKEDGE_io_RISE ? _GEN_15 : 128'h0; 
  wire  _GEN_19 = change | dataOut; 
  wire [9:0] _T_14 = lastOne * 2'h2; 
  wire [9:0] _GEN_49 = {{2'd0}, deltaCntr}; 
  wire  _GEN_21 = ~zeroFlipped ? _clkRec_T : _GEN_6; 
  wire  _GEN_22 = ~zeroFlipped | _GEN_8; 
  wire  _GEN_24 = deltaCntr > lastOne & _GEN_49 < _T_14 ? _GEN_21 : _GEN_6; 
  wire  _GEN_26 = ~syncFlipped ? _clkRec_T : _GEN_24; 
  wire  _GEN_27 = ~syncFlipped | _GEN_9; 
  wire  _GEN_28 = _GEN_49 >= _T_14 ? _GEN_26 : _GEN_24; 
  wire [9:0] _T_21 = lastOne * 2'h3; 
  wire  _T_23 = ~syncFlipped1; 
  wire [63:0] _leds_T = {{46'd0}, BFR1_io_dataOut[63:46]}; 
  wire [63:0] _leds_T_1 = _leds_T & 64'hffff; 
  wire  _GEN_31 = ~syncFlipped1 | _GEN_10; 
  wire [63:0] _GEN_34 = ~syncFlipped1 ? BFR_io_dataOut : 64'h0; 
  wire [63:0] _GEN_35 = ~syncFlipped1 ? _leds_T_1 : {{48'd0}, leds}; 
  wire  _GEN_36 = _GEN_49 >= _T_21 | _GEN_11; 
  wire [63:0] _GEN_42 = _GEN_49 >= _T_21 ? _GEN_35 : {{48'd0}, leds}; 
  wire [15:0] _GEN_43 = io_BTN_C ? io_SW : {{8'd0}, lastOne}; 
  wire [63:0] _GEN_44 = io_BTN_C ? {{48'd0}, io_SW} : _GEN_42; 
  wire [15:0] _GEN_45 = io_SW > 16'h0 ? _GEN_43 : {{8'd0}, lastOne}; 
  wire [63:0] _GEN_46 = io_SW > 16'h0 ? _GEN_44 : _GEN_42; 
  wire [15:0] _GEN_53 = reset ? 16'hf : _GEN_45; 
  wire [63:0] _GEN_54 = reset ? 64'h0 : _GEN_46; 
  RWSmem BFR ( 
    .clock(BFR_clock),
    .io_write(BFR_io_write),
    .io_dataIn(BFR_io_dataIn),
    .io_dataOut(BFR_io_dataOut)
  );
  RWSmem BFR1 ( 
    .clock(BFR1_clock),
    .io_write(BFR1_io_write),
    .io_dataIn(BFR1_io_dataIn),
    .io_dataOut(BFR1_io_dataOut)
  );
  edgeDetector CLKEDGE ( 
    .clock(CLKEDGE_clock),
    .reset(CLKEDGE_reset),
    .io_INPUT(CLKEDGE_io_INPUT),
    .io_RISE(CLKEDGE_io_RISE)
  );
  assign io_CLK_OUT = clkRec; 
  assign io_DATA_OUT = dataOut; 
  assign io_DBUG = change; 
  assign io_DBUG1 = syncWord; 
  assign io_LED = leds; 
  assign io_DATAREG = BFR1_io_dataOut; 
  assign BFR_clock = clock;
  assign BFR_io_write = CLKEDGE_io_RISE | syncWord; 
  assign BFR_io_dataIn = _GEN_18[63:0];
  assign BFR1_clock = clock;
  assign BFR1_io_write = _GEN_49 >= _T_21 & _T_23; 
  assign BFR1_io_dataIn = _GEN_49 >= _T_21 ? _GEN_34 : 64'h0; 
  assign CLKEDGE_clock = clock;
  assign CLKEDGE_reset = reset;
  assign CLKEDGE_io_INPUT = clkRec; 