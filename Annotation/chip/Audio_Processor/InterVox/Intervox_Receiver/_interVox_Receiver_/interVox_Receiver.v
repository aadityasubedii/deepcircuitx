module RWSmem(
  input         clock,
  input         io_write,
  input  [63:0] io_dataIn,
  output [63:0] io_dataOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mem [0:0]; // @[intervox_receiver.scala 69:24]
  wire  mem_rdwrPort_r_en; // @[intervox_receiver.scala 69:24]
  wire  mem_rdwrPort_r_addr; // @[intervox_receiver.scala 69:24]
  wire [63:0] mem_rdwrPort_r_data; // @[intervox_receiver.scala 69:24]
  wire [63:0] mem_rdwrPort_w_data; // @[intervox_receiver.scala 69:24]
  wire  mem_rdwrPort_w_addr; // @[intervox_receiver.scala 69:24]
  wire  mem_rdwrPort_w_mask; // @[intervox_receiver.scala 69:24]
  wire  mem_rdwrPort_w_en; // @[intervox_receiver.scala 69:24]
  reg  mem_rdwrPort_r_en_pipe_0;
  reg  mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_en = mem_rdwrPort_r_en_pipe_0;
  assign mem_rdwrPort_r_addr = mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_data = mem[mem_rdwrPort_r_addr]; // @[intervox_receiver.scala 69:24]
  assign mem_rdwrPort_w_data = io_dataIn;
  assign mem_rdwrPort_w_addr = 1'h0;
  assign mem_rdwrPort_w_mask = io_write;
  assign mem_rdwrPort_w_en = 1'h1 & io_write;
  assign io_dataOut = mem_rdwrPort_r_data; // @[intervox_receiver.scala 75:21 76:34]
  always @(posedge clock) begin
    if (mem_rdwrPort_w_en & mem_rdwrPort_w_mask) begin
      mem[mem_rdwrPort_w_addr] <= mem_rdwrPort_w_data; // @[intervox_receiver.scala 69:24]
    end
    mem_rdwrPort_r_en_pipe_0 <= 1'h1 & ~io_write;
    if (1'h1 & ~io_write) begin
      mem_rdwrPort_r_addr_pipe_0 <= 1'h0;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    mem[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_rdwrPort_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_rdwrPort_r_addr_pipe_0 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module edgeDetector(
  input   clock,
  input   reset,
  input   io_INPUT,
  output  io_RISE
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] inBufr; // @[intervox_receiver.scala 12:34]
  reg [1:0] inBufrPrev; // @[intervox_receiver.scala 13:34]
  reg  rising; // @[intervox_receiver.scala 15:34]
  wire [1:0] _inBufr_T_1 = inBufr + 2'h1; // @[intervox_receiver.scala 26:35]
  wire [1:0] _inBufr_T_3 = inBufr - 2'h1; // @[intervox_receiver.scala 33:35]
  wire  _T_5 = inBufr == 2'h1; // @[intervox_receiver.scala 39:41]
  wire  _GEN_9 = inBufrPrev == 2'h0 & inBufr == 2'h1 | rising; // @[intervox_receiver.scala 39:50 41:17 15:34]
  assign io_RISE = rising; // @[intervox_receiver.scala 57:15]
  always @(posedge clock) begin
    if (reset) begin // @[intervox_receiver.scala 12:34]
      inBufr <= 2'h0; // @[intervox_receiver.scala 12:34]
    end else if (io_INPUT) begin // @[intervox_receiver.scala 22:21]
      if (inBufr < 2'h2) begin // @[intervox_receiver.scala 24:27]
        inBufr <= _inBufr_T_1; // @[intervox_receiver.scala 26:25]
      end
    end else if (~io_INPUT) begin // @[intervox_receiver.scala 22:21]
      if (inBufr > 2'h0) begin // @[intervox_receiver.scala 31:27]
        inBufr <= _inBufr_T_3; // @[intervox_receiver.scala 33:25]
      end
    end
    if (reset) begin // @[intervox_receiver.scala 13:34]
      inBufrPrev <= 2'h0; // @[intervox_receiver.scala 13:34]
    end else if (io_INPUT) begin // @[intervox_receiver.scala 22:21]
      if (inBufr < 2'h2) begin // @[intervox_receiver.scala 24:27]
        inBufrPrev <= inBufr; // @[intervox_receiver.scala 27:25]
      end
    end else if (~io_INPUT) begin // @[intervox_receiver.scala 22:21]
      if (inBufr > 2'h0) begin // @[intervox_receiver.scala 31:27]
        inBufrPrev <= inBufr; // @[intervox_receiver.scala 34:25]
      end
    end
    if (reset) begin // @[intervox_receiver.scala 15:34]
      rising <= 1'h0; // @[intervox_receiver.scala 15:34]
    end else if (rising) begin // @[intervox_receiver.scala 52:28]
      rising <= 1'h0; // @[intervox_receiver.scala 52:38]
    end else if (inBufrPrev == 2'h2 & _T_5) begin // @[intervox_receiver.scala 45:50]
      rising <= 1'h0; // @[intervox_receiver.scala 47:17]
    end else begin
      rising <= _GEN_9;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
  rising = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
`endif // RANDOMIZE_REG_INIT
  wire  BFR_clock; // @[intervox_receiver.scala 94:29]
  wire  BFR_io_write; // @[intervox_receiver.scala 94:29]
  wire [63:0] BFR_io_dataIn; // @[intervox_receiver.scala 94:29]
  wire [63:0] BFR_io_dataOut; // @[intervox_receiver.scala 94:29]
  wire  BFR1_clock; // @[intervox_receiver.scala 99:30]
  wire  BFR1_io_write; // @[intervox_receiver.scala 99:30]
  wire [63:0] BFR1_io_dataIn; // @[intervox_receiver.scala 99:30]
  wire [63:0] BFR1_io_dataOut; // @[intervox_receiver.scala 99:30]
  wire  CLKEDGE_clock; // @[intervox_receiver.scala 132:37]
  wire  CLKEDGE_reset; // @[intervox_receiver.scala 132:37]
  wire  CLKEDGE_io_INPUT; // @[intervox_receiver.scala 132:37]
  wire  CLKEDGE_io_RISE; // @[intervox_receiver.scala 132:37]
  reg [7:0] lastOne; // @[intervox_receiver.scala 109:30]
  reg [15:0] leds; // @[intervox_receiver.scala 110:30]
  reg [1:0] inBufr; // @[intervox_receiver.scala 112:30]
  reg [7:0] deltaCntr; // @[intervox_receiver.scala 113:30]
  reg [6:0] bitCntr; // @[intervox_receiver.scala 114:30]
  reg  clkRec; // @[intervox_receiver.scala 115:30]
  reg  change; // @[intervox_receiver.scala 117:30]
  reg  dataOut; // @[intervox_receiver.scala 118:30]
  reg  syncWord; // @[intervox_receiver.scala 119:30]
  reg  zeroFlipped; // @[intervox_receiver.scala 120:30]
  reg  syncFlipped; // @[intervox_receiver.scala 121:30]
  reg  syncFlipped1; // @[intervox_receiver.scala 122:30]
  wire [7:0] _deltaCntr_T_1 = deltaCntr + 8'h1; // @[intervox_receiver.scala 130:31]
  wire [1:0] _inBufr_T_1 = inBufr + 2'h1; // @[intervox_receiver.scala 147:34]
  wire [1:0] _inBufr_T_3 = inBufr - 2'h1; // @[intervox_receiver.scala 153:34]
  wire  _GEN_4 = inBufr[0] ^ inBufr[1] | change; // @[intervox_receiver.scala 157:36 158:16 117:30]
  wire  _clkRec_T = ~clkRec; // @[intervox_receiver.scala 167:28]
  wire  _GEN_6 = change ? ~clkRec : clkRec; // @[intervox_receiver.scala 164:25 167:25 115:30]
  wire  _GEN_8 = change ? 1'h0 : zeroFlipped; // @[intervox_receiver.scala 164:25 171:25 120:30]
  wire  _GEN_9 = change ? 1'h0 : syncFlipped; // @[intervox_receiver.scala 164:25 172:25 121:30]
  wire  _GEN_10 = change ? 1'h0 : syncFlipped1; // @[intervox_receiver.scala 164:25 173:25 122:30]
  wire  _GEN_11 = syncWord ? 1'h0 : syncWord; // @[intervox_receiver.scala 176:27 177:21 119:30]
  wire [6:0] _GEN_12 = syncWord ? 7'h0 : bitCntr; // @[intervox_receiver.scala 176:27 178:21 114:30]
  wire [6:0] _bitCntr_T_1 = bitCntr + 7'h1; // @[intervox_receiver.scala 185:28]
  wire [6:0] _BFR_io_dataIn_T_1 = 7'h3f - bitCntr; // @[intervox_receiver.scala 189:65]
  wire [127:0] _BFR_io_dataIn_T_2 = 128'h1 << _BFR_io_dataIn_T_1; // @[intervox_receiver.scala 189:56]
  wire [127:0] _GEN_47 = {{64'd0}, BFR_io_dataOut}; // @[intervox_receiver.scala 189:49]
  wire [127:0] _BFR_io_dataIn_T_3 = _GEN_47 | _BFR_io_dataIn_T_2; // @[intervox_receiver.scala 189:49]
  wire [127:0] _BFR_io_dataIn_T_6 = 128'h0 << _BFR_io_dataIn_T_1; // @[intervox_receiver.scala 191:56]
  wire [127:0] _BFR_io_dataIn_T_7 = _GEN_47 & _BFR_io_dataIn_T_6; // @[intervox_receiver.scala 191:49]
  wire [127:0] _GEN_15 = dataOut ? _BFR_io_dataIn_T_3 : _BFR_io_dataIn_T_7; // @[intervox_receiver.scala 188:30 189:31 191:31]
  wire [6:0] _GEN_16 = CLKEDGE_io_RISE ? _bitCntr_T_1 : _GEN_12; // @[intervox_receiver.scala 184:34 185:17]
  wire [127:0] _GEN_18 = CLKEDGE_io_RISE ? _GEN_15 : 128'h0; // @[intervox_receiver.scala 184:34]
  wire  _GEN_19 = change | dataOut; // @[intervox_receiver.scala 202:29 205:21 118:30]
  wire [9:0] _T_14 = lastOne * 2'h2; // @[intervox_receiver.scala 212:59]
  wire [9:0] _GEN_49 = {{2'd0}, deltaCntr}; // @[intervox_receiver.scala 212:47]
  wire  _GEN_21 = ~zeroFlipped ? _clkRec_T : _GEN_6; // @[intervox_receiver.scala 218:34 221:20]
  wire  _GEN_22 = ~zeroFlipped | _GEN_8; // @[intervox_receiver.scala 218:34 222:25]
  wire  _GEN_24 = deltaCntr > lastOne & _GEN_49 < _T_14 ? _GEN_21 : _GEN_6; // @[intervox_receiver.scala 212:68]
  wire  _GEN_26 = ~syncFlipped ? _clkRec_T : _GEN_24; // @[intervox_receiver.scala 238:34 240:20]
  wire  _GEN_27 = ~syncFlipped | _GEN_9; // @[intervox_receiver.scala 238:34 241:25]
  wire  _GEN_28 = _GEN_49 >= _T_14 ? _GEN_26 : _GEN_24; // @[intervox_receiver.scala 231:43]
  wire [9:0] _T_21 = lastOne * 2'h3; // @[intervox_receiver.scala 244:34]
  wire  _T_23 = ~syncFlipped1; // @[intervox_receiver.scala 252:27]
  wire [63:0] _leds_T = {{46'd0}, BFR1_io_dataOut[63:46]}; // @[intervox_receiver.scala 263:41]
  wire [63:0] _leds_T_1 = _leds_T & 64'hffff; // @[intervox_receiver.scala 263:50]
  wire  _GEN_31 = ~syncFlipped1 | _GEN_10; // @[intervox_receiver.scala 252:35 255:26]
  wire [63:0] _GEN_34 = ~syncFlipped1 ? BFR_io_dataOut : 64'h0; // @[intervox_receiver.scala 103:28 252:35 261:29]
  wire [63:0] _GEN_35 = ~syncFlipped1 ? _leds_T_1 : {{48'd0}, leds}; // @[intervox_receiver.scala 252:35 263:21 110:30]
  wire  _GEN_36 = _GEN_49 >= _T_21 | _GEN_11; // @[intervox_receiver.scala 244:43 251:18]
  wire [63:0] _GEN_42 = _GEN_49 >= _T_21 ? _GEN_35 : {{48'd0}, leds}; // @[intervox_receiver.scala 110:30 244:43]
  wire [15:0] _GEN_43 = io_BTN_C ? io_SW : {{8'd0}, lastOne}; // @[intervox_receiver.scala 269:31 270:21 109:30]
  wire [63:0] _GEN_44 = io_BTN_C ? {{48'd0}, io_SW} : _GEN_42; // @[intervox_receiver.scala 269:31 271:21]
  wire [15:0] _GEN_45 = io_SW > 16'h0 ? _GEN_43 : {{8'd0}, lastOne}; // @[intervox_receiver.scala 268:22 109:30]
  wire [63:0] _GEN_46 = io_SW > 16'h0 ? _GEN_44 : _GEN_42; // @[intervox_receiver.scala 268:22]
  wire [15:0] _GEN_53 = reset ? 16'hf : _GEN_45; // @[intervox_receiver.scala 109:{30,30}]
  wire [63:0] _GEN_54 = reset ? 64'h0 : _GEN_46; // @[intervox_receiver.scala 110:{30,30}]
  RWSmem BFR ( // @[intervox_receiver.scala 94:29]
    .clock(BFR_clock),
    .io_write(BFR_io_write),
    .io_dataIn(BFR_io_dataIn),
    .io_dataOut(BFR_io_dataOut)
  );
  RWSmem BFR1 ( // @[intervox_receiver.scala 99:30]
    .clock(BFR1_clock),
    .io_write(BFR1_io_write),
    .io_dataIn(BFR1_io_dataIn),
    .io_dataOut(BFR1_io_dataOut)
  );
  edgeDetector CLKEDGE ( // @[intervox_receiver.scala 132:37]
    .clock(CLKEDGE_clock),
    .reset(CLKEDGE_reset),
    .io_INPUT(CLKEDGE_io_INPUT),
    .io_RISE(CLKEDGE_io_RISE)
  );
  assign io_CLK_OUT = clkRec; // @[intervox_receiver.scala 135:21]
  assign io_DATA_OUT = dataOut; // @[intervox_receiver.scala 126:21]
  assign io_DBUG = change; // @[intervox_receiver.scala 137:21]
  assign io_DBUG1 = syncWord; // @[intervox_receiver.scala 127:21]
  assign io_LED = leds; // @[intervox_receiver.scala 128:21]
  assign io_DATAREG = BFR1_io_dataOut; // @[intervox_receiver.scala 136:21]
  assign BFR_clock = clock;
  assign BFR_io_write = CLKEDGE_io_RISE | syncWord; // @[intervox_receiver.scala 184:34 187:27]
  assign BFR_io_dataIn = _GEN_18[63:0];
  assign BFR1_clock = clock;
  assign BFR1_io_write = _GEN_49 >= _T_21 & _T_23; // @[intervox_receiver.scala 102:28 244:43]
  assign BFR1_io_dataIn = _GEN_49 >= _T_21 ? _GEN_34 : 64'h0; // @[intervox_receiver.scala 103:28 244:43]
  assign CLKEDGE_clock = clock;
  assign CLKEDGE_reset = reset;
  assign CLKEDGE_io_INPUT = clkRec; // @[intervox_receiver.scala 133:29]
  always @(posedge clock) begin
    lastOne <= _GEN_53[7:0]; // @[intervox_receiver.scala 109:{30,30}]
    leds <= _GEN_54[15:0]; // @[intervox_receiver.scala 110:{30,30}]
    if (reset) begin // @[intervox_receiver.scala 112:30]
      inBufr <= 2'h0; // @[intervox_receiver.scala 112:30]
    end else if (io_DATA_IN) begin // @[intervox_receiver.scala 143:23]
      if (inBufr < 2'h3) begin // @[intervox_receiver.scala 145:31]
        inBufr <= _inBufr_T_1; // @[intervox_receiver.scala 147:24]
      end
    end else if (~io_DATA_IN) begin // @[intervox_receiver.scala 143:23]
      if (inBufr > 2'h0) begin // @[intervox_receiver.scala 151:31]
        inBufr <= _inBufr_T_3; // @[intervox_receiver.scala 153:24]
      end
    end
    if (reset) begin // @[intervox_receiver.scala 113:30]
      deltaCntr <= 8'h0; // @[intervox_receiver.scala 113:30]
    end else if (change) begin // @[intervox_receiver.scala 164:25]
      deltaCntr <= 8'h0; // @[intervox_receiver.scala 169:25]
    end else begin
      deltaCntr <= _deltaCntr_T_1; // @[intervox_receiver.scala 130:18]
    end
    if (reset) begin // @[intervox_receiver.scala 114:30]
      bitCntr <= 7'h0; // @[intervox_receiver.scala 114:30]
    end else if (_GEN_49 >= _T_21) begin // @[intervox_receiver.scala 244:43]
      if (~syncFlipped1) begin // @[intervox_receiver.scala 252:35]
        bitCntr <= 7'h0; // @[intervox_receiver.scala 257:21]
      end else begin
        bitCntr <= _GEN_16;
      end
    end else begin
      bitCntr <= _GEN_16;
    end
    if (reset) begin // @[intervox_receiver.scala 115:30]
      clkRec <= 1'h0; // @[intervox_receiver.scala 115:30]
    end else if (_GEN_49 >= _T_21) begin // @[intervox_receiver.scala 244:43]
      if (~syncFlipped1) begin // @[intervox_receiver.scala 252:35]
        clkRec <= _clkRec_T; // @[intervox_receiver.scala 254:20]
      end else begin
        clkRec <= _GEN_28;
      end
    end else begin
      clkRec <= _GEN_28;
    end
    if (reset) begin // @[intervox_receiver.scala 117:30]
      change <= 1'h0; // @[intervox_receiver.scala 117:30]
    end else if (change) begin // @[intervox_receiver.scala 164:25]
      change <= 1'h0; // @[intervox_receiver.scala 165:16]
    end else begin
      change <= _GEN_4;
    end
    if (reset) begin // @[intervox_receiver.scala 118:30]
      dataOut <= 1'h0; // @[intervox_receiver.scala 118:30]
    end else if (deltaCntr > lastOne & _GEN_49 < _T_14) begin // @[intervox_receiver.scala 212:68]
      dataOut <= 1'h0; // @[intervox_receiver.scala 216:17]
    end else if (deltaCntr <= lastOne) begin // @[intervox_receiver.scala 199:35]
      dataOut <= _GEN_19;
    end
    if (reset) begin // @[intervox_receiver.scala 119:30]
      syncWord <= 1'h0; // @[intervox_receiver.scala 119:30]
    end else begin
      syncWord <= _GEN_36;
    end
    if (reset) begin // @[intervox_receiver.scala 120:30]
      zeroFlipped <= 1'h0; // @[intervox_receiver.scala 120:30]
    end else if (deltaCntr > lastOne & _GEN_49 < _T_14) begin // @[intervox_receiver.scala 212:68]
      zeroFlipped <= _GEN_22;
    end else if (change) begin // @[intervox_receiver.scala 164:25]
      zeroFlipped <= 1'h0; // @[intervox_receiver.scala 171:25]
    end
    if (reset) begin // @[intervox_receiver.scala 121:30]
      syncFlipped <= 1'h0; // @[intervox_receiver.scala 121:30]
    end else if (_GEN_49 >= _T_14) begin // @[intervox_receiver.scala 231:43]
      syncFlipped <= _GEN_27;
    end else if (change) begin // @[intervox_receiver.scala 164:25]
      syncFlipped <= 1'h0; // @[intervox_receiver.scala 172:25]
    end
    if (reset) begin // @[intervox_receiver.scala 122:30]
      syncFlipped1 <= 1'h0; // @[intervox_receiver.scala 122:30]
    end else if (_GEN_49 >= _T_21) begin // @[intervox_receiver.scala 244:43]
      syncFlipped1 <= _GEN_31;
    end else if (change) begin // @[intervox_receiver.scala 164:25]
      syncFlipped1 <= 1'h0; // @[intervox_receiver.scala 173:25]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
  lastOne = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  leds = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  inBufr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  deltaCntr = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  bitCntr = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  clkRec = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  change = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  dataOut = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  syncWord = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  zeroFlipped = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  syncFlipped = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  syncFlipped1 = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module i2s_Transmitter(
  input         clock,
  input         reset,
  input         io_CLK_IN,
  input  [63:0] io_DATA_IN,
  input         io_NEXT,
  output        io_LRCLK,
  output        io_SDATA
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  CLK1EDGE_clock; // @[intervox_receiver.scala 292:38]
  wire  CLK1EDGE_reset; // @[intervox_receiver.scala 292:38]
  wire  CLK1EDGE_io_INPUT; // @[intervox_receiver.scala 292:38]
  wire  CLK1EDGE_io_RISE; // @[intervox_receiver.scala 292:38]
  reg [7:0] bitCntrTrans; // @[intervox_receiver.scala 285:31]
  reg  lrclk; // @[intervox_receiver.scala 286:26]
  reg  sdataO; // @[intervox_receiver.scala 287:26]
  wire [7:0] _bitCntrTrans_T_1 = bitCntrTrans + 8'h1; // @[intervox_receiver.scala 302:38]
  wire  _GEN_1 = bitCntrTrans == 8'h0 | lrclk; // @[intervox_receiver.scala 304:35 306:19 286:26]
  wire  _T_3 = bitCntrTrans > 8'h1f; // @[intervox_receiver.scala 308:27]
  wire [7:0] _sdataO_T_1 = 8'h3c - bitCntrTrans; // @[intervox_receiver.scala 314:45]
  wire [63:0] _sdataO_T_2 = io_DATA_IN >> _sdataO_T_1; // @[intervox_receiver.scala 314:39]
  wire  _GEN_3 = bitCntrTrans <= 8'h18 ? _sdataO_T_2[0] : sdataO; // @[intervox_receiver.scala 312:37 314:20 287:26]
  wire  _GEN_4 = bitCntrTrans > 8'h18 & bitCntrTrans <= 8'h1f ? 1'h0 : _GEN_3; // @[intervox_receiver.scala 316:61 318:20]
  wire [7:0] _sdataO_T_6 = bitCntrTrans + 8'h1f; // @[intervox_receiver.scala 322:61]
  wire [7:0] _sdataO_T_8 = 8'h24 - _sdataO_T_6; // @[intervox_receiver.scala 322:45]
  wire [63:0] _sdataO_T_9 = io_DATA_IN >> _sdataO_T_8; // @[intervox_receiver.scala 322:39]
  edgeDetector CLK1EDGE ( // @[intervox_receiver.scala 292:38]
    .clock(CLK1EDGE_clock),
    .reset(CLK1EDGE_reset),
    .io_INPUT(CLK1EDGE_io_INPUT),
    .io_RISE(CLK1EDGE_io_RISE)
  );
  assign io_LRCLK = lrclk; // @[intervox_receiver.scala 289:17]
  assign io_SDATA = sdataO; // @[intervox_receiver.scala 290:17]
  assign CLK1EDGE_clock = clock;
  assign CLK1EDGE_reset = reset;
  assign CLK1EDGE_io_INPUT = io_CLK_IN; // @[intervox_receiver.scala 293:30]
  always @(posedge clock) begin
    if (reset) begin // @[intervox_receiver.scala 285:31]
      bitCntrTrans <= 8'h0; // @[intervox_receiver.scala 285:31]
    end else if (CLK1EDGE_io_RISE) begin // @[intervox_receiver.scala 300:35]
      bitCntrTrans <= _bitCntrTrans_T_1; // @[intervox_receiver.scala 302:22]
    end else if (io_NEXT) begin // @[intervox_receiver.scala 296:26]
      bitCntrTrans <= 8'h0; // @[intervox_receiver.scala 297:22]
    end
    if (reset) begin // @[intervox_receiver.scala 286:26]
      lrclk <= 1'h0; // @[intervox_receiver.scala 286:26]
    end else if (CLK1EDGE_io_RISE) begin // @[intervox_receiver.scala 300:35]
      if (bitCntrTrans > 8'h1f) begin // @[intervox_receiver.scala 308:34]
        lrclk <= 1'h0; // @[intervox_receiver.scala 310:19]
      end else begin
        lrclk <= _GEN_1;
      end
    end
    if (reset) begin // @[intervox_receiver.scala 287:26]
      sdataO <= 1'h0; // @[intervox_receiver.scala 287:26]
    end else if (CLK1EDGE_io_RISE) begin // @[intervox_receiver.scala 300:35]
      if (bitCntrTrans > 8'h38) begin // @[intervox_receiver.scala 324:36]
        sdataO <= 1'h0; // @[intervox_receiver.scala 326:20]
      end else if (bitCntrTrans <= 8'h38 & _T_3) begin // @[intervox_receiver.scala 320:61]
        sdataO <= _sdataO_T_9[0]; // @[intervox_receiver.scala 322:20]
      end else begin
        sdataO <= _GEN_4;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
  wire  clockRec_clock; // @[intervox_receiver.scala 350:29]
  wire  clockRec_reset; // @[intervox_receiver.scala 350:29]
  wire  clockRec_io_DATA_IN; // @[intervox_receiver.scala 350:29]
  wire  clockRec_io_CLK_OUT; // @[intervox_receiver.scala 350:29]
  wire  clockRec_io_DATA_OUT; // @[intervox_receiver.scala 350:29]
  wire  clockRec_io_DBUG; // @[intervox_receiver.scala 350:29]
  wire  clockRec_io_DBUG1; // @[intervox_receiver.scala 350:29]
  wire [15:0] clockRec_io_LED; // @[intervox_receiver.scala 350:29]
  wire [15:0] clockRec_io_SW; // @[intervox_receiver.scala 350:29]
  wire [63:0] clockRec_io_DATAREG; // @[intervox_receiver.scala 350:29]
  wire  clockRec_io_BTN_C; // @[intervox_receiver.scala 350:29]
  wire  i2sTrans_clock; // @[intervox_receiver.scala 361:29]
  wire  i2sTrans_reset; // @[intervox_receiver.scala 361:29]
  wire  i2sTrans_io_CLK_IN; // @[intervox_receiver.scala 361:29]
  wire [63:0] i2sTrans_io_DATA_IN; // @[intervox_receiver.scala 361:29]
  wire  i2sTrans_io_NEXT; // @[intervox_receiver.scala 361:29]
  wire  i2sTrans_io_LRCLK; // @[intervox_receiver.scala 361:29]
  wire  i2sTrans_io_SDATA; // @[intervox_receiver.scala 361:29]
  clock_Recovery clockRec ( // @[intervox_receiver.scala 350:29]
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
  i2s_Transmitter i2sTrans ( // @[intervox_receiver.scala 361:29]
    .clock(i2sTrans_clock),
    .reset(i2sTrans_reset),
    .io_CLK_IN(i2sTrans_io_CLK_IN),
    .io_DATA_IN(i2sTrans_io_DATA_IN),
    .io_NEXT(i2sTrans_io_NEXT),
    .io_LRCLK(i2sTrans_io_LRCLK),
    .io_SDATA(i2sTrans_io_SDATA)
  );
  assign io_CLK_REC = 1'h0; // @[intervox_receiver.scala 357:21]
  assign io_DATA_OUT = clockRec_io_DATA_OUT; // @[intervox_receiver.scala 355:21]
  assign io_CLK_DBUG = 1'h0; // @[intervox_receiver.scala 356:21]
  assign io_DBUG = clockRec_io_DBUG; // @[intervox_receiver.scala 359:21]
  assign io_DBUG1 = clockRec_io_DBUG1; // @[intervox_receiver.scala 358:21]
  assign io_LED = clockRec_io_LED; // @[intervox_receiver.scala 354:21]
  assign io_BCLK = clockRec_io_CLK_OUT; // @[intervox_receiver.scala 365:21]
  assign io_LRCLK = i2sTrans_io_LRCLK; // @[intervox_receiver.scala 367:21]
  assign io_SDATA = i2sTrans_io_SDATA; // @[intervox_receiver.scala 366:21]
  assign clockRec_clock = clock;
  assign clockRec_reset = reset;
  assign clockRec_io_DATA_IN = io_INTERVOX_IN; // @[intervox_receiver.scala 351:29]
  assign clockRec_io_SW = io_SW; // @[intervox_receiver.scala 352:29]
  assign clockRec_io_BTN_C = io_BTN_C; // @[intervox_receiver.scala 353:29]
  assign i2sTrans_clock = clock;
  assign i2sTrans_reset = reset;
  assign i2sTrans_io_CLK_IN = clockRec_io_CLK_OUT; // @[intervox_receiver.scala 362:29]
  assign i2sTrans_io_DATA_IN = clockRec_io_DATAREG; // @[intervox_receiver.scala 363:29]
  assign i2sTrans_io_NEXT = clockRec_io_DBUG1; // @[intervox_receiver.scala 364:29]
endmodule
