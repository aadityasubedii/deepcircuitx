`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:30 05/27/2019 
// Design Name: 
// Module Name:    oddeven 
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
module oddeven(a,b,E,ansA,ansB);
input [3:0]a;
input	[3:0]b;
input E;
output ansA;
output ansB;

wire [3:0]w;
wire wireAnsA, wireAnsB;

xor(w[0], a[3], a[2]);
xor(w[1], a[1], w[0]);
xor(wireAnsA, a[0], w[1]);

xor(w[2], b[3], b[2]);
xor(w[3], b[1], w[2]);
xor(wireAnsB, b[0], w[3]);

and(ansA, E, wireAnsA);
and(ansB, E, wireAnsB);


endmodule
