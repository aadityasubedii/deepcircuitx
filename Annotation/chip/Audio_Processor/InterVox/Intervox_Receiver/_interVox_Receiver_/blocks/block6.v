  wire  CLK1EDGE_clock; 
  wire  CLK1EDGE_reset; 
  wire  CLK1EDGE_io_INPUT; 
  wire  CLK1EDGE_io_RISE; 
  reg [7:0] bitCntrTrans; 
  reg  lrclk; 
  reg  sdataO; 
  wire [7:0] _bitCntrTrans_T_1 = bitCntrTrans + 8'h1; 
  wire  _GEN_1 = bitCntrTrans == 8'h0 | lrclk; 
  wire  _T_3 = bitCntrTrans > 8'h1f; 
  wire [7:0] _sdataO_T_1 = 8'h3c - bitCntrTrans; 
  wire [63:0] _sdataO_T_2 = io_DATA_IN >> _sdataO_T_1; 
  wire  _GEN_3 = bitCntrTrans <= 8'h18 ? _sdataO_T_2[0] : sdataO; 
  wire  _GEN_4 = bitCntrTrans > 8'h18 & bitCntrTrans <= 8'h1f ? 1'h0 : _GEN_3; 
  wire [7:0] _sdataO_T_6 = bitCntrTrans + 8'h1f; 
  wire [7:0] _sdataO_T_8 = 8'h24 - _sdataO_T_6; 
  wire [63:0] _sdataO_T_9 = io_DATA_IN >> _sdataO_T_8; 
  edgeDetector CLK1EDGE ( 
    .clock(CLK1EDGE_clock),
    .reset(CLK1EDGE_reset),
    .io_INPUT(CLK1EDGE_io_INPUT),
    .io_RISE(CLK1EDGE_io_RISE)
  );
  assign io_LRCLK = lrclk; 
  assign io_SDATA = sdataO; 
  assign CLK1EDGE_clock = clock;
  assign CLK1EDGE_reset = reset;
  assign CLK1EDGE_io_INPUT = io_CLK_IN; 