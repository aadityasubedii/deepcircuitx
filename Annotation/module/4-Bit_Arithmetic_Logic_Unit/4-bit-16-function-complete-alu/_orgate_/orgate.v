`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:06 05/26/2019 
// Design Name: 
// Module Name:    orgate 
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
module orgate(a,b,s);
input		[3:0]a;
input		[3:0]b;
output	[3:0]s;

	or	(s[0],a[0],b[0]);
	or	(s[1],a[1],b[1]);
	or	(s[2],a[2],b[2]);
	or	(s[3],a[3],b[3]);
	
endmodule