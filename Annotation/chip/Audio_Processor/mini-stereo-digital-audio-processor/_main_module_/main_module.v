`timescale 1ns / 1ps

module main_module(Sclk,Dclk,Frame,InputL,InputR,Start,Reset_n,OutputL,OutputR,OutReady,InReady);


input Sclk, Dclk, InputL, InputR, Frame, Start, Reset_n;
output OutputL, OutputR, OutReady, InReady;

wire S2P_status,add_statusL,shift_statusL,addorsubL,alu_status,P2S_status,sleep_status,clear;
wire add_statusR,shift_statusR,addorsubR;
wire [3:0]address_rj;
wire [8:0]address_coeff;
wire [9:0]address_in;
wire [15:0]S2P_L;
wire [15:0]S2P_R;
wire [15:0]inputdataL;
wire [15:0]inputdataR;
wire [15:0] coeffdataL,coeffdataR;
wire [15:0] rjdataL,rjdataR;
wire [39:0]signoutL;
wire [8:0]index_inL;
wire [39:0]signoutR;
wire [8:0]index_inR;
wire [8:0]index_coeffL;
wire [8:0]index_coeffR;
wire [3:0]index_rjL;
wire [3:0]index_rjR;
wire [39:0] addip1L,addip2L,addopL;
wire [39:0] shiftipL,shiftopL;
wire [39:0]OutputdataL;
wire [39:0] addip1R,addip2R,addopR;
wire [39:0] shiftipR,shiftopR;
wire [39:0]OutputdataR;
wire [12:0] cont_address;
wire [12:0] set;
wire [31:0]col_out;

//Calling Controller
Controller cont(
	.Sclk(Sclk),
	.Dclk(Dclk),
	.Frame(Frame),
	.S2P_status(S2P_status),
	.rj_status(rj_status),
	.coeff_status(coeff_status),
	.in_status(in_status),
	.InReady(InReady),
	.address_rj(address_rj),
	.address_coeff(address_coeff),
	.address_in(address_in),
	.alu_status(alu_status),
	.set(set),
	.cont_address(cont_address),
	.sleep_status(sleep_status),
	.col(col_out),
	.Reset_n(Reset_n),
	.clear(clear),
	.Start(Start)
);

//Calling S2P
S2P s2p(
	.Dclk(Dclk),
	.Frame(Frame),
	.InputL(InputL),
	.InputR(InputR),
	.S2P_status(S2P_status),
	.S2P_L(S2P_L),
	.S2P_R(S2P_R),
	.Reset_n(Reset_n)
);

//Calling Rj_L Mem
RjL_mem rjl(
	.Sclk(Sclk),
	.rj_status(rj_status),
	.row(address_rj),
	.Input(S2P_L),
	.index_rjL(index_rjL),
	.rjdataL(rjdataL),
	.clear(clear)
);	
	
//Calling Rj_R Mem
RjR_mem rjr(
	.Sclk(Sclk),
	.rj_status(rj_status),
	.row(address_rj),
	.Input(S2P_R),
	.index_rjR(index_rjR),
	.rjdataR(rjdataR),
	.clear(clear)
);	

//Calling Coeff_L Mem
CoeffL_mem coeffl(
	.Sclk(Sclk),
	.coeff_status(coeff_status),
	.row(address_coeff),
	.Input(S2P_L),
	.index_coeffL(index_coeffL),
	.coeffdataL(coeffdataL),
	.clear(clear)
);

//Calling Coeff_R Mem
CoeffR_mem coeffr(
	.Sclk(Sclk),
	.coeff_status(coeff_status),
	.row(address_coeff),
	.Input(S2P_R),
	.index_coeffR(index_coeffR),
	.coeffdataR(coeffdataR),
	.clear(clear)
);

//Calling Input_L Mem
InL_mem inl(
	.Sclk(Sclk),
	.in_status(in_status),
	.row(address_in),
	.Input(S2P_L),
	.index_inL(index_inL),
	.inputdataL(inputdataL),
	.Reset_n(Reset_n),
	.clear(clear)
);

//Calling Input_R Mem
InR_mem inr(
	.Sclk(Sclk),
	.in_status(in_status),
	.row(address_in),
	.Input(S2P_R),
	.index_inR(index_inR),
	.inputdataR(inputdataR),
	.Reset_n(Reset_n),
	.clear(clear)
);		
	
//Calling ALU 
ALU_Controller alu(
	.Sclk(Sclk),
	.Dclk(Dclk),
	.Frame(Frame),
	.read_rjl(rjdataL),
	.read_rjr(rjdataR),
	.read_coeffl(coeffdataL),
	.read_coeffr(coeffdataR),
	.cont_address(cont_address),
	.signoutL(signoutL),
	.signoutR(signoutR),
	.sign_statusL(sign_statusL),
	.sign_statusR(sign_statusR),
	.index_rjL(index_rjL),
	.index_coeffL(index_coeffL),
	.index_inL(index_inL),
	.index_rjR(index_rjR),
	.index_coeffR(index_coeffR),
	.index_inR(index_inR),
	.add_statusL(add_statusL),
	.addip1L(addip1L),
	.addip2L(addip2L),
	.addopL(addopL),
	.addorsubL(addorsubL),
	.shift_statusL(shift_StatusL),
	.shiftipL(shiftipL),
	.shiftopL(shiftopL),
	.add_statusR(add_statusR),
	.addip1R(addip1R),
	.addip2R(addip2R),
	.addopR(addopR),
	.addorsubR(addorsubR),
	.shift_statusR(shift_StatusR),
	.shiftipR(shiftipR),
	.shiftopR(shiftopR),
	.alu_status(alu_status),
	.P2S_status(P2S_status),
	.OutputdataL(OutputdataL),
	.OutputdataR(OutputdataR),
	.set(set),
	.Reset_n(Reset_n)
);

//Calling Sign Extension_L
SignextL signL(
	.Sclk(Sclk),
	.sign_statusL(sign_statusL),
	.signinL(inputdataL),
	.signoutL(signoutL)
);

//Calling Sign Extension_R
SignextR signR(
	.Sclk(Sclk),
	.sign_statusR(sign_statusR),
	.signinR(inputdataR),
	.signoutR(signoutR)
);

//Calling Adder_L
AdderL addl(
	.add_statusL(add_statusL),
	.addip1L(addip1L),
	.addip2L(addip2L),
	.addopL(addopL),
	.addorsubL(addorsubL)
);

//Calling Adder_R
AdderR addr(
	.add_statusR(add_statusR),
	.addip1R(addip1R),
	.addip2R(addip2R),
	.addopR(addopR),
	.addorsubR(addorsubR)
);

//Calling Shifter_l
ShifterL shiftl(
	.shift_statusL(shift_StatusL),
	.shiftipL(shiftipL),
	.shiftopL(shiftopL)
);

//Calling Shifter_r
ShifterR shiftr(
	.shift_statusR(shift_StatusR),
	.shiftipR(shiftipR),
	.shiftopR(shiftopR)
);

//Calling Zero_detector
Zero_detector zero (
	.in_status(in_status),
	.sleep_status(sleep_status),
	.InputL(S2P_L),
	.InputR(S2P_R),
	.OutReady(OutReady),
	.col(col_out),
	.Reset_n(Reset_n)
);

//calling P2S module
P2S p2s(
	.OutputdataL(OutputdataL), 
	.OutputL(OutputL), 
	.OutputdataR(OutputdataR), 
	.OutputR(OutputR), 
	.Sclk(Sclk),
	.Frame(Frame),
	.P2S_status(P2S_status), 
	.OutReady(OutReady),
	.col_out(col_out)
);

endmodule
