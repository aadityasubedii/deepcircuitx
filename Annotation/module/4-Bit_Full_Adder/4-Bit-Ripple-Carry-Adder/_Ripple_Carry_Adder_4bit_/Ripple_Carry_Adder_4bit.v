`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2023 16:47:45
// Design Name: 
// Module Name: Ripple_Carry_Adder_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Ripple_Carry_Adder_4bit(
input [3:0]a,
input [3:0]b,
input c,
output [3:0]sum,
output cout
);
wire c1,c2,c3;
FA d0(a[0],b[0],c,sum[0],c1);
FA d1(a[1],b[1],c1,sum[1],c2);
FA d2(a[2],b[2],c2,sum[2],c3);
FA d3(a[3],b[3],c3,sum[3],cout);
endmodule

module FA(
input a, 
input b,
input cin,
output sum,
output cout
);
assign sum = a^b^cin;
assign cout = (a&b)|(cin&(a^b));
endmodule
