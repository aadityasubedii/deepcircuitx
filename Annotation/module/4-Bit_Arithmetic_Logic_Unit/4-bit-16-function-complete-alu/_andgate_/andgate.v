`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:21 05/26/2019 
// Design Name: 
// Module Name:    andgate 
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
module andmod(a,b,ab);
input		[3:0]a;
input		[3:0]b;
output	[3:0]ab;

	and	(ab[0],a[0],b[0]);
	and	(ab[1],a[1],b[1]);
	and	(ab[2],a[2],b[2]);
	and	(ab[3],a[3],b[3]);

endmodule
