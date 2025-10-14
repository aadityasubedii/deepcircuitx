
`timescale 1 ns / 1ns
module Test_maxAbsValueCir();
reg global_reset;
reg [3:0]w1;
reg [3:0]w2;
reg [3:0]w3;

wire reg[3:0]out;

wire reg[3:0]out_eq;

wire reg[3:0]out_net;

reg [0:11]MHMH_dataBus;
reg [31:0] addBus = 32'h00000000;
reg MW;

maxAbsValueCir INS_test(w1,
w2,
w3,
out);

maxAbsValueCir_eq INS_test_eq(global_reset, w1,
w2,
w3,
out_eq);

maxAbsValueCir_net INS_test_net(global_reset, w1,
w2,
w3,
out_net);



initial begin
MW = 0;
addBus = 32'h00000000;
end
always @(w1,
w2,
w3) begin
addBus = addBus+1;

MHMH_dataBus[0] = w1[0];
MHMH_dataBus[1] = w1[1];
MHMH_dataBus[2] = w1[2];
MHMH_dataBus[3] = w1[3];
MHMH_dataBus[4] = w2[0];
MHMH_dataBus[5] = w2[1];
MHMH_dataBus[6] = w2[2];
MHMH_dataBus[7] = w2[3];
MHMH_dataBus[8] = w3[0];
MHMH_dataBus[9] = w3[1];
MHMH_dataBus[10] = w3[2];
MHMH_dataBus[11] = w3[3];
end

memModule #(12) INS_MEM (global_reset, MW, addBus, MHMH_dataBus);



endmodule
