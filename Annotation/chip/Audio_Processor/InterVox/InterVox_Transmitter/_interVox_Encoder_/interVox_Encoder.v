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
  reg [63:0] mem [0:0]; // @[intervox_transmitter.scala 19:24]
  wire  mem_rdwrPort_r_en; // @[intervox_transmitter.scala 19:24]
  wire  mem_rdwrPort_r_addr; // @[intervox_transmitter.scala 19:24]
  wire [63:0] mem_rdwrPort_r_data; // @[intervox_transmitter.scala 19:24]
  wire [63:0] mem_rdwrPort_w_data; // @[intervox_transmitter.scala 19:24]
  wire  mem_rdwrPort_w_addr; // @[intervox_transmitter.scala 19:24]
  wire  mem_rdwrPort_w_mask; // @[intervox_transmitter.scala 19:24]
  wire  mem_rdwrPort_w_en; // @[intervox_transmitter.scala 19:24]
  reg  mem_rdwrPort_r_en_pipe_0;
  reg  mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_en = mem_rdwrPort_r_en_pipe_0;
  assign mem_rdwrPort_r_addr = mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_data = mem[mem_rdwrPort_r_addr]; // @[intervox_transmitter.scala 19:24]
  assign mem_rdwrPort_w_data = io_dataIn;
  assign mem_rdwrPort_w_addr = 1'h0;
  assign mem_rdwrPort_w_mask = io_write;
  assign mem_rdwrPort_w_en = 1'h1 & io_write;
  assign io_dataOut = mem_rdwrPort_r_data; // @[intervox_transmitter.scala 25:21 26:34]
  always @(posedge clock) begin
    if (mem_rdwrPort_w_en & mem_rdwrPort_w_mask) begin
      mem[mem_rdwrPort_w_addr] <= mem_rdwrPort_w_data; // @[intervox_transmitter.scala 19:24]
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
module biPhaseEncoder(
  input         clock,
  input         reset,
  output        io_DATA_OUT,
  input  [63:0] io_AUDIOINPUT,
  input  [63:0] io_DSPINPUT,
  input         io_ENA,
  input         io_CLK
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  outReg; // @[intervox_transmitter.scala 38:32]
  reg [63:0] stereoData; // @[intervox_transmitter.scala 39:32]
  reg [15:0] dspData; // @[intervox_transmitter.scala 40:32]
  reg [7:0] bitCntr_enc; // @[intervox_transmitter.scala 41:32]
  reg  hasNone; // @[intervox_transmitter.scala 42:32]
  reg [5:0] dataIndex; // @[intervox_transmitter.scala 44:32]
  reg  ndexR; // @[intervox_transmitter.scala 45:32]
  reg  enabled; // @[intervox_transmitter.scala 46:32]
  wire [7:0] _bitCntr_enc_T_1 = bitCntr_enc + 8'h1; // @[intervox_transmitter.scala 60:38]
  wire  _outReg_T = ~outReg; // @[intervox_transmitter.scala 70:23]
  wire  _GEN_0 = bitCntr_enc == 8'h3 ? ~outReg : outReg; // @[intervox_transmitter.scala 69:36 70:20 38:32]
  wire  _GEN_1 = bitCntr_enc == 8'h4 ? _outReg_T : _GEN_0; // @[intervox_transmitter.scala 73:36 74:20]
  wire  _GEN_2 = bitCntr_enc == 8'h5 ? _outReg_T : _GEN_1; // @[intervox_transmitter.scala 76:36 77:20]
  wire [5:0] _dataIndex_T_1 = dataIndex + 6'h1; // @[intervox_transmitter.scala 87:38]
  wire [5:0] _GEN_3 = ndexR ? _dataIndex_T_1 : dataIndex; // @[intervox_transmitter.scala 85:32 87:25 44:32]
  wire [5:0] _T_10 = 6'h3e - dataIndex; // @[intervox_transmitter.scala 106:41]
  wire [63:0] _T_11 = stereoData >> _T_10; // @[intervox_transmitter.scala 106:35]
  wire  _GEN_4 = ~_T_11[0] | hasNone; // @[intervox_transmitter.scala 106:66 108:29 42:32]
  wire  _GEN_5 = ndexR ? _GEN_4 : hasNone; // @[intervox_transmitter.scala 105:36 42:32]
  wire  _GEN_6 = bitCntr_enc < 8'h35 ? _GEN_5 : hasNone; // @[intervox_transmitter.scala 103:37 42:32]
  wire [5:0] _T_19 = dataIndex - 6'h18; // @[intervox_transmitter.scala 120:53]
  wire [5:0] _T_21 = 6'h26 - _T_19; // @[intervox_transmitter.scala 120:40]
  wire [63:0] _T_22 = stereoData >> _T_21; // @[intervox_transmitter.scala 120:33]
  wire  _GEN_7 = ~_T_22[0] | _GEN_6; // @[intervox_transmitter.scala 120:73 121:27]
  wire  _GEN_8 = ndexR ? _GEN_7 : _GEN_6; // @[intervox_transmitter.scala 119:34]
  wire  _GEN_9 = bitCntr_enc >= 8'h35 & bitCntr_enc < 8'h65 ? _GEN_8 : _GEN_6; // @[intervox_transmitter.scala 117:64]
  wire [5:0] _T_30 = dataIndex - 6'h30; // @[intervox_transmitter.scala 132:42]
  wire [15:0] _T_31 = dspData >> _T_30; // @[intervox_transmitter.scala 132:30]
  wire  _GEN_10 = ~_T_31[0] | _GEN_9; // @[intervox_transmitter.scala 132:62 133:27]
  wire  _GEN_11 = ndexR ? _GEN_10 : _GEN_9; // @[intervox_transmitter.scala 131:34]
  wire  _GEN_12 = bitCntr_enc >= 8'h65 & bitCntr_enc <= 8'h7f ? _GEN_11 : _GEN_9; // @[intervox_transmitter.scala 130:66]
  wire  _GEN_13 = hasNone ? outReg : _outReg_T; // @[intervox_transmitter.scala 143:34 145:22 150:24]
  wire  _GEN_14 = hasNone ? 1'h0 : _GEN_12; // @[intervox_transmitter.scala 143:34 146:23]
  wire [5:0] _GEN_16 = bitCntr_enc > 8'h5 ? _GEN_3 : dataIndex; // @[intervox_transmitter.scala 44:32 81:36]
  wire [63:0] _GEN_34 = reset ? 64'h0 : io_DSPINPUT; // @[intervox_transmitter.scala 40:{32,32} 51:17]
  assign io_DATA_OUT = outReg; // @[intervox_transmitter.scala 48:17]
  always @(posedge clock) begin
    if (reset) begin // @[intervox_transmitter.scala 38:32]
      outReg <= 1'h0; // @[intervox_transmitter.scala 38:32]
    end else if (io_CLK) begin // @[intervox_transmitter.scala 55:25]
      if (enabled) begin // @[intervox_transmitter.scala 57:28]
        if (bitCntr_enc > 8'h5) begin // @[intervox_transmitter.scala 81:36]
          outReg <= _GEN_13;
        end else begin
          outReg <= _GEN_2;
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 39:32]
      stereoData <= 64'h0; // @[intervox_transmitter.scala 39:32]
    end else begin
      stereoData <= io_AUDIOINPUT; // @[intervox_transmitter.scala 50:17]
    end
    dspData <= _GEN_34[15:0]; // @[intervox_transmitter.scala 40:{32,32} 51:17]
    if (reset) begin // @[intervox_transmitter.scala 41:32]
      bitCntr_enc <= 8'h0; // @[intervox_transmitter.scala 41:32]
    end else if (io_CLK) begin // @[intervox_transmitter.scala 55:25]
      if (enabled) begin // @[intervox_transmitter.scala 57:28]
        if (bitCntr_enc == 8'h7f) begin // @[intervox_transmitter.scala 155:38]
          bitCntr_enc <= 8'h0; // @[intervox_transmitter.scala 156:25]
        end else begin
          bitCntr_enc <= _bitCntr_enc_T_1; // @[intervox_transmitter.scala 60:23]
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 42:32]
      hasNone <= 1'h0; // @[intervox_transmitter.scala 42:32]
    end else if (io_CLK) begin // @[intervox_transmitter.scala 55:25]
      if (enabled) begin // @[intervox_transmitter.scala 57:28]
        if (bitCntr_enc > 8'h5) begin // @[intervox_transmitter.scala 81:36]
          hasNone <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 44:32]
      dataIndex <= 6'h0; // @[intervox_transmitter.scala 44:32]
    end else if (io_CLK) begin // @[intervox_transmitter.scala 55:25]
      if (enabled) begin // @[intervox_transmitter.scala 57:28]
        if (bitCntr_enc == 8'h7f) begin // @[intervox_transmitter.scala 155:38]
          dataIndex <= 6'h0; // @[intervox_transmitter.scala 157:23]
        end else begin
          dataIndex <= _GEN_16;
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 45:32]
      ndexR <= 1'h0; // @[intervox_transmitter.scala 45:32]
    end else if (io_CLK) begin // @[intervox_transmitter.scala 55:25]
      if (enabled) begin // @[intervox_transmitter.scala 57:28]
        if (bitCntr_enc > 8'h5) begin // @[intervox_transmitter.scala 81:36]
          ndexR <= ~ndexR; // @[intervox_transmitter.scala 84:19]
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 46:32]
      enabled <= 1'h0; // @[intervox_transmitter.scala 46:32]
    end else if (io_CLK) begin // @[intervox_transmitter.scala 55:25]
      if (enabled) begin // @[intervox_transmitter.scala 57:28]
        if (bitCntr_enc == 8'h7f) begin // @[intervox_transmitter.scala 155:38]
          enabled <= 1'h0; // @[intervox_transmitter.scala 158:21]
        end else begin
          enabled <= io_ENA; // @[intervox_transmitter.scala 52:17]
        end
      end else begin
        enabled <= io_ENA; // @[intervox_transmitter.scala 52:17]
      end
    end else begin
      enabled <= io_ENA; // @[intervox_transmitter.scala 52:17]
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] inBufr; // @[intervox_transmitter.scala 172:34]
  reg [1:0] inBufrPrev; // @[intervox_transmitter.scala 173:34]
  reg  trailing; // @[intervox_transmitter.scala 174:34]
  reg  rising; // @[intervox_transmitter.scala 175:34]
  reg  change; // @[intervox_transmitter.scala 176:34]
  wire [1:0] _inBufr_T_1 = inBufr + 2'h1; // @[intervox_transmitter.scala 186:35]
  wire [1:0] _inBufr_T_3 = inBufr - 2'h1; // @[intervox_transmitter.scala 193:35]
  wire  _GEN_8 = inBufr[0] ^ inBufr[1] | change; // @[intervox_transmitter.scala 199:36 200:17 176:34]
  wire  _T_8 = inBufr == 2'h1; // @[intervox_transmitter.scala 203:41]
  wire  _GEN_9 = inBufrPrev == 2'h0 & inBufr == 2'h1 ? 1'h0 : trailing; // @[intervox_transmitter.scala 203:50 204:17 174:34]
  wire  _GEN_10 = inBufrPrev == 2'h0 & inBufr == 2'h1 | rising; // @[intervox_transmitter.scala 203:50 205:17 175:34]
  wire  _GEN_11 = inBufrPrev == 2'h0 & inBufr == 2'h1 | _GEN_8; // @[intervox_transmitter.scala 203:50 206:17]
  wire  _GEN_12 = inBufrPrev == 2'h2 & _T_8 | _GEN_9; // @[intervox_transmitter.scala 209:50 210:17]
  wire  _GEN_14 = inBufrPrev == 2'h2 & _T_8 | _GEN_11; // @[intervox_transmitter.scala 209:50 212:17]
  assign io_TRAIL = trailing; // @[intervox_transmitter.scala 223:13]
  assign io_RISE = rising; // @[intervox_transmitter.scala 224:13]
  assign io_CHANGE = change; // @[intervox_transmitter.scala 222:13]
  always @(posedge clock) begin
    if (reset) begin // @[intervox_transmitter.scala 172:34]
      inBufr <= 2'h0; // @[intervox_transmitter.scala 172:34]
    end else if (io_INPUT) begin // @[intervox_transmitter.scala 182:21]
      if (inBufr < 2'h2) begin // @[intervox_transmitter.scala 184:27]
        inBufr <= _inBufr_T_1; // @[intervox_transmitter.scala 186:25]
      end
    end else if (~io_INPUT) begin // @[intervox_transmitter.scala 182:21]
      if (inBufr > 2'h0) begin // @[intervox_transmitter.scala 191:27]
        inBufr <= _inBufr_T_3; // @[intervox_transmitter.scala 193:25]
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 173:34]
      inBufrPrev <= 2'h0; // @[intervox_transmitter.scala 173:34]
    end else if (io_INPUT) begin // @[intervox_transmitter.scala 182:21]
      if (inBufr < 2'h2) begin // @[intervox_transmitter.scala 184:27]
        inBufrPrev <= inBufr; // @[intervox_transmitter.scala 187:25]
      end
    end else if (~io_INPUT) begin // @[intervox_transmitter.scala 182:21]
      if (inBufr > 2'h0) begin // @[intervox_transmitter.scala 191:27]
        inBufrPrev <= inBufr; // @[intervox_transmitter.scala 194:25]
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 174:34]
      trailing <= 1'h0; // @[intervox_transmitter.scala 174:34]
    end else if (trailing) begin // @[intervox_transmitter.scala 215:27]
      trailing <= 1'h0; // @[intervox_transmitter.scala 215:37]
    end else begin
      trailing <= _GEN_12;
    end
    if (reset) begin // @[intervox_transmitter.scala 175:34]
      rising <= 1'h0; // @[intervox_transmitter.scala 175:34]
    end else if (rising) begin // @[intervox_transmitter.scala 216:27]
      rising <= 1'h0; // @[intervox_transmitter.scala 216:37]
    end else if (inBufrPrev == 2'h2 & _T_8) begin // @[intervox_transmitter.scala 209:50]
      rising <= 1'h0; // @[intervox_transmitter.scala 211:17]
    end else begin
      rising <= _GEN_10;
    end
    if (reset) begin // @[intervox_transmitter.scala 176:34]
      change <= 1'h0; // @[intervox_transmitter.scala 176:34]
    end else if (change) begin // @[intervox_transmitter.scala 218:25]
      change <= 1'h0; // @[intervox_transmitter.scala 219:16]
    end else begin
      change <= _GEN_14;
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
  trailing = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  rising = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  change = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module interVox_Encoder(
  input         clock,
  input         reset,
  output        io_MCLK_O,
  input         io_BCLK_IN,
  input         io_LRCLK_IN,
  input         io_SDATA_IN,
  output        io_DATA_O,
  output        io_LRCLK_O,
  output        io_BCLK_O,
  output        io_SDATA_O,
  output        io_NXT_FRAME,
  input  [15:0] io_SW,
  output [15:0] io_LED,
  input         io_BTN_C,
  input         io_BTN_D,
  input         io_BTN_L,
  input         io_BTN_R
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
`endif // RANDOMIZE_REG_INIT
  wire  BFR_clock; // @[intervox_transmitter.scala 266:33]
  wire  BFR_io_write; // @[intervox_transmitter.scala 266:33]
  wire [63:0] BFR_io_dataIn; // @[intervox_transmitter.scala 266:33]
  wire [63:0] BFR_io_dataOut; // @[intervox_transmitter.scala 266:33]
  wire  BFR1_clock; // @[intervox_transmitter.scala 267:33]
  wire  BFR1_io_write; // @[intervox_transmitter.scala 267:33]
  wire [63:0] BFR1_io_dataIn; // @[intervox_transmitter.scala 267:33]
  wire [63:0] BFR1_io_dataOut; // @[intervox_transmitter.scala 267:33]
  wire  biPhaseEncoder_clock; // @[intervox_transmitter.scala 269:35]
  wire  biPhaseEncoder_reset; // @[intervox_transmitter.scala 269:35]
  wire  biPhaseEncoder_io_DATA_OUT; // @[intervox_transmitter.scala 269:35]
  wire [63:0] biPhaseEncoder_io_AUDIOINPUT; // @[intervox_transmitter.scala 269:35]
  wire [63:0] biPhaseEncoder_io_DSPINPUT; // @[intervox_transmitter.scala 269:35]
  wire  biPhaseEncoder_io_ENA; // @[intervox_transmitter.scala 269:35]
  wire  biPhaseEncoder_io_CLK; // @[intervox_transmitter.scala 269:35]
  wire  LREDGE_clock; // @[intervox_transmitter.scala 271:33]
  wire  LREDGE_reset; // @[intervox_transmitter.scala 271:33]
  wire  LREDGE_io_INPUT; // @[intervox_transmitter.scala 271:33]
  wire  LREDGE_io_TRAIL; // @[intervox_transmitter.scala 271:33]
  wire  LREDGE_io_RISE; // @[intervox_transmitter.scala 271:33]
  wire  LREDGE_io_CHANGE; // @[intervox_transmitter.scala 271:33]
  wire  BCLKEDGE_clock; // @[intervox_transmitter.scala 273:33]
  wire  BCLKEDGE_reset; // @[intervox_transmitter.scala 273:33]
  wire  BCLKEDGE_io_INPUT; // @[intervox_transmitter.scala 273:33]
  wire  BCLKEDGE_io_TRAIL; // @[intervox_transmitter.scala 273:33]
  wire  BCLKEDGE_io_RISE; // @[intervox_transmitter.scala 273:33]
  wire  BCLKEDGE_io_CHANGE; // @[intervox_transmitter.scala 273:33]
  wire  DATAEDGE_clock; // @[intervox_transmitter.scala 275:33]
  wire  DATAEDGE_reset; // @[intervox_transmitter.scala 275:33]
  wire  DATAEDGE_io_INPUT; // @[intervox_transmitter.scala 275:33]
  wire  DATAEDGE_io_TRAIL; // @[intervox_transmitter.scala 275:33]
  wire  DATAEDGE_io_RISE; // @[intervox_transmitter.scala 275:33]
  wire  DATAEDGE_io_CHANGE; // @[intervox_transmitter.scala 275:33]
  reg [1:0] currentState; // @[intervox_transmitter.scala 248:33]
  reg  syncing; // @[intervox_transmitter.scala 250:34]
  reg  synced; // @[intervox_transmitter.scala 251:34]
  reg  biPhaseEna; // @[intervox_transmitter.scala 252:34]
  reg [15:0] leds; // @[intervox_transmitter.scala 255:34]
  reg [15:0] left; // @[intervox_transmitter.scala 256:34]
  reg [15:0] right; // @[intervox_transmitter.scala 257:34]
  reg [15:0] dspData; // @[intervox_transmitter.scala 258:34]
  reg [7:0] bitCntr; // @[intervox_transmitter.scala 264:34]
  wire  _GEN_0 = LREDGE_io_TRAIL | syncing; // @[intervox_transmitter.scala 323:34 324:15 250:34]
  wire [7:0] _bitCntr_T_1 = bitCntr + 8'h1; // @[intervox_transmitter.scala 327:30]
  wire  _GEN_1 = LREDGE_io_RISE | synced; // @[intervox_transmitter.scala 329:35 330:19 251:34]
  wire [7:0] _GEN_2 = LREDGE_io_RISE ? 8'h0 : _bitCntr_T_1; // @[intervox_transmitter.scala 327:19 329:35 331:19]
  wire [7:0] _GEN_3 = syncing ? _GEN_2 : bitCntr; // @[intervox_transmitter.scala 326:27 264:34]
  wire [7:0] _GEN_6 = ~synced ? _GEN_3 : bitCntr; // @[intervox_transmitter.scala 321:23 264:34]
  wire  _T_8 = BCLKEDGE_io_RISE; // @[intervox_transmitter.scala 365:31]
  wire  _T_11 = ~io_SDATA_IN; // @[intervox_transmitter.scala 387:33]
  wire [7:0] _BFR_io_dataIn_T_1 = bitCntr - 8'h1e; // @[intervox_transmitter.scala 391:80]
  wire [7:0] _BFR_io_dataIn_T_3 = 8'h27 - _BFR_io_dataIn_T_1; // @[intervox_transmitter.scala 391:69]
  wire [255:0] _BFR_io_dataIn_T_4 = 256'h0 << _BFR_io_dataIn_T_3; // @[intervox_transmitter.scala 391:60]
  wire [255:0] _GEN_89 = {{192'd0}, BFR_io_dataOut}; // @[intervox_transmitter.scala 391:53]
  wire [255:0] _BFR_io_dataIn_T_5 = _GEN_89 | _BFR_io_dataIn_T_4; // @[intervox_transmitter.scala 391:53]
  wire [255:0] _GEN_8 = ~io_SDATA_IN ? _BFR_io_dataIn_T_5 : 256'h0; // @[intervox_transmitter.scala 290:25 387:42 391:35]
  wire [255:0] _BFR_io_dataIn_T_10 = 256'h1 << _BFR_io_dataIn_T_3; // @[intervox_transmitter.scala 394:60]
  wire [255:0] _BFR_io_dataIn_T_11 = _GEN_89 | _BFR_io_dataIn_T_10; // @[intervox_transmitter.scala 394:53]
  wire [255:0] _GEN_9 = io_SDATA_IN ? _BFR_io_dataIn_T_11 : _GEN_8; // @[intervox_transmitter.scala 393:42 394:35]
  wire [7:0] _BFR_io_dataIn_T_15 = 8'h3f - _bitCntr_T_1; // @[intervox_transmitter.scala 402:69]
  wire [255:0] _BFR_io_dataIn_T_16 = 256'h0 << _BFR_io_dataIn_T_15; // @[intervox_transmitter.scala 402:60]
  wire [255:0] _BFR_io_dataIn_T_17 = _GEN_89 | _BFR_io_dataIn_T_16; // @[intervox_transmitter.scala 402:53]
  wire [255:0] _GEN_10 = _T_11 ? _BFR_io_dataIn_T_17 : 256'h0; // @[intervox_transmitter.scala 290:25 399:43 402:35]
  wire [255:0] _BFR_io_dataIn_T_22 = 256'h1 << _BFR_io_dataIn_T_15; // @[intervox_transmitter.scala 405:61]
  wire [255:0] _BFR_io_dataIn_T_23 = _GEN_89 | _BFR_io_dataIn_T_22; // @[intervox_transmitter.scala 405:53]
  wire [255:0] _GEN_11 = io_SDATA_IN ? _BFR_io_dataIn_T_23 : _GEN_10; // @[intervox_transmitter.scala 404:42 405:35]
  wire [255:0] _GEN_13 = bitCntr > 8'h1f ? _GEN_9 : _GEN_11; // @[intervox_transmitter.scala 383:33]
  wire [15:0] _GEN_14 = io_BTN_L ? io_SW : left; // @[intervox_transmitter.scala 416:35 418:23 256:34]
  wire [15:0] _GEN_15 = io_BTN_L ? left : leds; // @[intervox_transmitter.scala 416:35 419:23 255:34]
  wire [15:0] _GEN_16 = io_BTN_R ? io_SW : right; // @[intervox_transmitter.scala 421:35 423:23 257:34]
  wire [15:0] _GEN_17 = io_BTN_R ? right : _GEN_15; // @[intervox_transmitter.scala 421:35 424:23]
  wire [15:0] _GEN_18 = io_BTN_C ? io_SW : dspData; // @[intervox_transmitter.scala 426:35 428:23 258:34]
  wire [15:0] _GEN_19 = io_BTN_C ? dspData : _GEN_17; // @[intervox_transmitter.scala 426:35 429:23]
  wire [62:0] _GEN_93 = {left, 47'h0}; // @[intervox_transmitter.scala 436:36]
  wire [78:0] _BFR_io_dataIn_T_24 = {{16'd0}, _GEN_93}; // @[intervox_transmitter.scala 436:36]
  wire [38:0] _GEN_94 = {right, 23'h0}; // @[intervox_transmitter.scala 436:56]
  wire [46:0] _BFR_io_dataIn_T_25 = {{8'd0}, _GEN_94}; // @[intervox_transmitter.scala 436:56]
  wire [78:0] _GEN_95 = {{32'd0}, _BFR_io_dataIn_T_25}; // @[intervox_transmitter.scala 436:47]
  wire [78:0] _BFR_io_dataIn_T_26 = _BFR_io_dataIn_T_24 | _GEN_95; // @[intervox_transmitter.scala 436:47]
  wire [255:0] _GEN_21 = io_SW == 16'h0 ? _GEN_13 : {{177'd0}, _BFR_io_dataIn_T_26}; // @[intervox_transmitter.scala 381:30 436:27]
  wire [15:0] _GEN_22 = io_SW == 16'h0 ? left : _GEN_14; // @[intervox_transmitter.scala 381:30 256:34]
  wire [15:0] _GEN_23 = io_SW == 16'h0 ? leds : _GEN_19; // @[intervox_transmitter.scala 381:30 255:34]
  wire [15:0] _GEN_24 = io_SW == 16'h0 ? right : _GEN_16; // @[intervox_transmitter.scala 381:30 257:34]
  wire [15:0] _GEN_25 = io_SW == 16'h0 ? dspData : _GEN_18; // @[intervox_transmitter.scala 381:30 258:34]
  wire  _T_18 = bitCntr == 8'h3f; // @[intervox_transmitter.scala 439:24]
  wire [63:0] _leds_T = {{47'd0}, BFR1_io_dataOut[63:47]}; // @[intervox_transmitter.scala 455:40]
  wire [63:0] _leds_T_1 = _leds_T & 64'hffff; // @[intervox_transmitter.scala 455:49]
  wire [63:0] _GEN_26 = io_BTN_D ? _leds_T_1 : {{48'd0}, _GEN_23}; // @[intervox_transmitter.scala 453:35 455:20]
  wire [63:0] _GEN_29 = BFR_io_dataOut; // @[intervox_transmitter.scala 294:25 439:33 445:32]
  wire [255:0] _GEN_30 = bitCntr == 8'h3f ? 256'h0 : _GEN_21; // @[intervox_transmitter.scala 439:33 449:28]
  wire [63:0] _GEN_31 = bitCntr == 8'h3f ? _GEN_26 : {{48'd0}, _GEN_23}; // @[intervox_transmitter.scala 439:33]
  wire [7:0] _GEN_32 = bitCntr == 8'h3f ? 8'h0 : _bitCntr_T_1; // @[intervox_transmitter.scala 371:19 439:33 458:21]
  wire  _GEN_33 = BCLKEDGE_io_RISE | biPhaseEna; // @[intervox_transmitter.scala 365:39 368:23 252:34]
  wire [7:0] _GEN_34 = BCLKEDGE_io_RISE ? _GEN_32 : _GEN_6; // @[intervox_transmitter.scala 365:39]
  wire [255:0] _GEN_36 = BCLKEDGE_io_RISE ? _GEN_30 : 256'h0; // @[intervox_transmitter.scala 290:25 365:39]
  wire [15:0] _GEN_37 = BCLKEDGE_io_RISE ? _GEN_22 : left; // @[intervox_transmitter.scala 256:34 365:39]
  wire [63:0] _GEN_38 = BCLKEDGE_io_RISE ? _GEN_31 : {{48'd0}, leds}; // @[intervox_transmitter.scala 255:34 365:39]
  wire [15:0] _GEN_39 = BCLKEDGE_io_RISE ? _GEN_24 : right; // @[intervox_transmitter.scala 257:34 365:39]
  wire [15:0] _GEN_40 = BCLKEDGE_io_RISE ? _GEN_25 : dspData; // @[intervox_transmitter.scala 258:34 365:39]
  wire  _GEN_41 = BCLKEDGE_io_RISE & _T_18; // @[intervox_transmitter.scala 293:25 365:39]
  wire [63:0] _GEN_42 = BCLKEDGE_io_RISE ? _GEN_29 : BFR_io_dataOut; // @[intervox_transmitter.scala 294:25 365:39]
  wire  _GEN_44 = synced ? _GEN_33 : biPhaseEna; // @[intervox_transmitter.scala 355:29 252:34]
  wire [7:0] _GEN_45 = synced ? _GEN_34 : _GEN_6; // @[intervox_transmitter.scala 355:29]
  wire  _GEN_46 = synced & _T_8; // @[intervox_transmitter.scala 289:25 355:29]
  wire [255:0] _GEN_47 = synced ? _GEN_36 : 256'h0; // @[intervox_transmitter.scala 290:25 355:29]
  wire [15:0] _GEN_48 = synced ? _GEN_37 : left; // @[intervox_transmitter.scala 355:29 256:34]
  wire [63:0] _GEN_49 = synced ? _GEN_38 : {{48'd0}, leds}; // @[intervox_transmitter.scala 355:29 255:34]
  wire [15:0] _GEN_50 = synced ? _GEN_39 : right; // @[intervox_transmitter.scala 355:29 257:34]
  wire [15:0] _GEN_51 = synced ? _GEN_40 : dspData; // @[intervox_transmitter.scala 355:29 258:34]
  wire  _GEN_52 = synced & _GEN_41; // @[intervox_transmitter.scala 293:25 355:29]
  wire [63:0] _GEN_53 = synced ? _GEN_42 : BFR_io_dataOut; // @[intervox_transmitter.scala 294:25 355:29]
  wire [255:0] _GEN_58 = 2'h2 == currentState ? _GEN_47 : 256'h0; // @[intervox_transmitter.scala 343:23 290:25]
  wire [63:0] _GEN_60 = 2'h2 == currentState ? _GEN_49 : {{48'd0}, leds}; // @[intervox_transmitter.scala 343:23 255:34]
  wire [63:0] _GEN_64 = 2'h2 == currentState ? _GEN_53 : BFR_io_dataOut; // @[intervox_transmitter.scala 343:23 294:25]
  wire  _GEN_69 = 2'h1 == currentState ? 1'h0 : 2'h2 == currentState & _GEN_46; // @[intervox_transmitter.scala 343:23 289:25]
  wire [255:0] _GEN_70 = 2'h1 == currentState ? 256'h0 : _GEN_58; // @[intervox_transmitter.scala 343:23 290:25]
  wire [63:0] _GEN_72 = 2'h1 == currentState ? {{48'd0}, leds} : _GEN_60; // @[intervox_transmitter.scala 343:23 255:34]
  wire  _GEN_75 = 2'h1 == currentState ? 1'h0 : 2'h2 == currentState & _GEN_52; // @[intervox_transmitter.scala 343:23 293:25]
  wire [63:0] _GEN_76 = 2'h1 == currentState ? BFR_io_dataOut : _GEN_64; // @[intervox_transmitter.scala 343:23 294:25]
  wire [255:0] _GEN_82 = 2'h0 == currentState ? 256'h0 : _GEN_70; // @[intervox_transmitter.scala 343:23 290:25]
  wire [63:0] _GEN_84 = 2'h0 == currentState ? {{48'd0}, leds} : _GEN_72; // @[intervox_transmitter.scala 343:23 255:34]
  wire [63:0] _GEN_97 = reset ? 64'h0 : _GEN_84; // @[intervox_transmitter.scala 255:{34,34}]
  RWSmem BFR ( // @[intervox_transmitter.scala 266:33]
    .clock(BFR_clock),
    .io_write(BFR_io_write),
    .io_dataIn(BFR_io_dataIn),
    .io_dataOut(BFR_io_dataOut)
  );
  RWSmem BFR1 ( // @[intervox_transmitter.scala 267:33]
    .clock(BFR1_clock),
    .io_write(BFR1_io_write),
    .io_dataIn(BFR1_io_dataIn),
    .io_dataOut(BFR1_io_dataOut)
  );
  biPhaseEncoder biPhaseEncoder ( // @[intervox_transmitter.scala 269:35]
    .clock(biPhaseEncoder_clock),
    .reset(biPhaseEncoder_reset),
    .io_DATA_OUT(biPhaseEncoder_io_DATA_OUT),
    .io_AUDIOINPUT(biPhaseEncoder_io_AUDIOINPUT),
    .io_DSPINPUT(biPhaseEncoder_io_DSPINPUT),
    .io_ENA(biPhaseEncoder_io_ENA),
    .io_CLK(biPhaseEncoder_io_CLK)
  );
  edgeDetector LREDGE ( // @[intervox_transmitter.scala 271:33]
    .clock(LREDGE_clock),
    .reset(LREDGE_reset),
    .io_INPUT(LREDGE_io_INPUT),
    .io_TRAIL(LREDGE_io_TRAIL),
    .io_RISE(LREDGE_io_RISE),
    .io_CHANGE(LREDGE_io_CHANGE)
  );
  edgeDetector BCLKEDGE ( // @[intervox_transmitter.scala 273:33]
    .clock(BCLKEDGE_clock),
    .reset(BCLKEDGE_reset),
    .io_INPUT(BCLKEDGE_io_INPUT),
    .io_TRAIL(BCLKEDGE_io_TRAIL),
    .io_RISE(BCLKEDGE_io_RISE),
    .io_CHANGE(BCLKEDGE_io_CHANGE)
  );
  edgeDetector DATAEDGE ( // @[intervox_transmitter.scala 275:33]
    .clock(DATAEDGE_clock),
    .reset(DATAEDGE_reset),
    .io_INPUT(DATAEDGE_io_INPUT),
    .io_TRAIL(DATAEDGE_io_TRAIL),
    .io_RISE(DATAEDGE_io_RISE),
    .io_CHANGE(DATAEDGE_io_CHANGE)
  );
  assign io_MCLK_O = clock; // @[intervox_transmitter.scala 280:25]
  assign io_DATA_O = biPhaseEncoder_io_DATA_OUT; // @[intervox_transmitter.scala 279:25]
  assign io_LRCLK_O = io_LRCLK_IN; // @[intervox_transmitter.scala 282:25]
  assign io_BCLK_O = io_BCLK_IN; // @[intervox_transmitter.scala 281:25]
  assign io_SDATA_O = io_SDATA_IN; // @[intervox_transmitter.scala 283:25]
  assign io_NXT_FRAME = BCLKEDGE_io_CHANGE; // @[intervox_transmitter.scala 297:33]
  assign io_LED = leds; // @[intervox_transmitter.scala 284:25]
  assign BFR_clock = clock;
  assign BFR_io_write = 2'h0 == currentState ? 1'h0 : _GEN_69; // @[intervox_transmitter.scala 343:23 289:25]
  assign BFR_io_dataIn = _GEN_82[63:0];
  assign BFR1_clock = clock;
  assign BFR1_io_write = 2'h0 == currentState ? 1'h0 : _GEN_75; // @[intervox_transmitter.scala 343:23 293:25]
  assign BFR1_io_dataIn = 2'h0 == currentState ? BFR_io_dataOut : _GEN_76; // @[intervox_transmitter.scala 343:23 294:25]
  assign biPhaseEncoder_clock = clock;
  assign biPhaseEncoder_reset = reset;
  assign biPhaseEncoder_io_AUDIOINPUT = BFR1_io_dataOut; // @[intervox_transmitter.scala 302:33]
  assign biPhaseEncoder_io_DSPINPUT = {{48'd0}, dspData}; // @[intervox_transmitter.scala 304:33]
  assign biPhaseEncoder_io_ENA = biPhaseEna; // @[intervox_transmitter.scala 300:33]
  assign biPhaseEncoder_io_CLK = BCLKEDGE_io_CHANGE; // @[intervox_transmitter.scala 299:33]
  assign LREDGE_clock = clock;
  assign LREDGE_reset = reset;
  assign LREDGE_io_INPUT = io_LRCLK_IN; // @[intervox_transmitter.scala 272:25]
  assign BCLKEDGE_clock = clock;
  assign BCLKEDGE_reset = reset;
  assign BCLKEDGE_io_INPUT = io_BCLK_IN; // @[intervox_transmitter.scala 274:25]
  assign DATAEDGE_clock = clock;
  assign DATAEDGE_reset = reset;
  assign DATAEDGE_io_INPUT = io_SDATA_IN; // @[intervox_transmitter.scala 276:25]
  always @(posedge clock) begin
    if (reset) begin // @[intervox_transmitter.scala 248:33]
      currentState <= 2'h0; // @[intervox_transmitter.scala 248:33]
    end else if (2'h0 == currentState) begin // @[intervox_transmitter.scala 343:23]
      currentState <= 2'h2; // @[intervox_transmitter.scala 347:20]
    end else if (2'h1 == currentState) begin // @[intervox_transmitter.scala 343:23]
      currentState <= 2'h2; // @[intervox_transmitter.scala 351:20]
    end
    if (reset) begin // @[intervox_transmitter.scala 250:34]
      syncing <= 1'h0; // @[intervox_transmitter.scala 250:34]
    end else if (~synced) begin // @[intervox_transmitter.scala 321:23]
      syncing <= _GEN_0;
    end
    if (reset) begin // @[intervox_transmitter.scala 251:34]
      synced <= 1'h0; // @[intervox_transmitter.scala 251:34]
    end else if (~synced) begin // @[intervox_transmitter.scala 321:23]
      if (syncing) begin // @[intervox_transmitter.scala 326:27]
        synced <= _GEN_1;
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 252:34]
      biPhaseEna <= 1'h0; // @[intervox_transmitter.scala 252:34]
    end else if (!(2'h0 == currentState)) begin // @[intervox_transmitter.scala 343:23]
      if (!(2'h1 == currentState)) begin // @[intervox_transmitter.scala 343:23]
        if (2'h2 == currentState) begin // @[intervox_transmitter.scala 343:23]
          biPhaseEna <= _GEN_44;
        end
      end
    end
    leds <= _GEN_97[15:0]; // @[intervox_transmitter.scala 255:{34,34}]
    if (reset) begin // @[intervox_transmitter.scala 256:34]
      left <= 16'h0; // @[intervox_transmitter.scala 256:34]
    end else if (!(2'h0 == currentState)) begin // @[intervox_transmitter.scala 343:23]
      if (!(2'h1 == currentState)) begin // @[intervox_transmitter.scala 343:23]
        if (2'h2 == currentState) begin // @[intervox_transmitter.scala 343:23]
          left <= _GEN_48;
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 257:34]
      right <= 16'h0; // @[intervox_transmitter.scala 257:34]
    end else if (!(2'h0 == currentState)) begin // @[intervox_transmitter.scala 343:23]
      if (!(2'h1 == currentState)) begin // @[intervox_transmitter.scala 343:23]
        if (2'h2 == currentState) begin // @[intervox_transmitter.scala 343:23]
          right <= _GEN_50;
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 258:34]
      dspData <= 16'h0; // @[intervox_transmitter.scala 258:34]
    end else if (!(2'h0 == currentState)) begin // @[intervox_transmitter.scala 343:23]
      if (!(2'h1 == currentState)) begin // @[intervox_transmitter.scala 343:23]
        if (2'h2 == currentState) begin // @[intervox_transmitter.scala 343:23]
          dspData <= _GEN_51;
        end
      end
    end
    if (reset) begin // @[intervox_transmitter.scala 264:34]
      bitCntr <= 8'h0; // @[intervox_transmitter.scala 264:34]
    end else if (2'h0 == currentState) begin // @[intervox_transmitter.scala 343:23]
      bitCntr <= _GEN_6;
    end else if (2'h1 == currentState) begin // @[intervox_transmitter.scala 343:23]
      bitCntr <= _GEN_6;
    end else if (2'h2 == currentState) begin // @[intervox_transmitter.scala 343:23]
      bitCntr <= _GEN_45;
    end else begin
      bitCntr <= _GEN_6;
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
  currentState = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  syncing = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  synced = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  biPhaseEna = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  leds = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  left = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  right = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  dspData = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  bitCntr = _RAND_8[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
