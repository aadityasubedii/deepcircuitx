`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:01:29 04/18/2016 
// Design Name: 
// Module Name:    BRFE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BRFE(
	input [3:0]b1,b2,b3,b4,b5,b6,
	output [3:0]bm1,bm2,bm3
	);
wire [3:0]a1,a2,a3,a4,a5,a6;
msb(b1,b2,a1);
msb(b3,b4,a2);
msb(b5,b6,a3);
mux(b1,b2,a1,a4);
mux(b3,b4,a2,a5);
mux(b5,b6,a3,a6);
add1(lut1,a4,bm1);
add1(lut2,a5,bm2);
add1(lut3,a6,bm3);
endmodule


module msb(x1,x2,x3);
input [3:0]x1,x2;
output [3:0]x3;
wire [3:0]temp;
assign temp = x2 - x1;
assign x3 = temp >> 2;
endmodule 

module mux(in1,in2,sel,out);
input [3:0]in1,in2,sel;
output reg[3:0]out;
always @(sel)
	if(sel > 4'b0000)
	begin 
			assign out = in2;
	end
else
	begin 
			assign out = in1;
	end
endmodule	


module add1(x,y,z);
input [3:0]x,y;
output [3:0]z;
assign z = x + y;
endmodule	