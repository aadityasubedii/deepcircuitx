`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:17 05/27/2019 
// Design Name: 
// Module Name:    oddparity 
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
module oddparity(a,b,E,ansA,ansB);

input [3:0]a;
input	[3:0]b;
input E;
output ansA;
output ansB;

wire [3:0]w;
wire [3:0]wireAns;

xor(w[0], a[3], a[2]);
xor(w[1], a[1], w[0]);
xor(wireAns[0], a[0], w[1]);

xor(w[2], b[3], b[2]);
xor(w[3], b[1], w[2]);
xor(wireAns[1], b[0], w[3]);

not(wireAns[2], wireAns[0]);
not(wireAns[3], wireAns[1]);

and(ansA, E, wireAns[2]);
and(ansB, E, wireAns[3]);




endmodule
