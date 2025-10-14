`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:49:00 05/26/2019 
// Design Name: 
// Module Name:    xorgate 
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
module xorgate(a,b,xs);

input		[3:0]a;
input		[3:0]b;
output	[3:0]xs;

	xor	(xs[0],a[0],b[0]);
	xor	(xs[1],a[1],b[1]);
	xor	(xs[2],a[2],b[2]);
	xor	(xs[3],a[3],b[3]);

endmodule
