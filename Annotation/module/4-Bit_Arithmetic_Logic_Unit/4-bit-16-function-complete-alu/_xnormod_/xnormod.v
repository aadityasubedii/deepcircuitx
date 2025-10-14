`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:51 05/27/2019 
// Design Name: 
// Module Name:    xnormod 
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
module xnormod(a,b,E,ans);
input [3:0]a;
input [3:0]b;
input E;

output [3:0]ans;
wire [3:0]w;

xnor(w[0], a[0], b[0]);
xnor(w[1], a[1], b[1]);

xnor(w[2], a[2], b[2]);
xnor(w[3], a[3], b[3]);

and(ans[0], E, w[0]);
and(ans[1], E, w[1]);
and(ans[2], E, w[2]);
and(ans[3], E, w[3]);

endmodule
