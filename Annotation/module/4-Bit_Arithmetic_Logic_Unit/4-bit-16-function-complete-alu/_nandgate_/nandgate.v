`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:11 05/26/2019 
// Design Name: 
// Module Name:    nandgate 
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
module nandgate(a,b,iab);
input		[3:0]a;
input		[3:0]b;
output	[3:0]iab;

	nand	(iab[0],a[0],b[0]);
	nand	(iab[1],a[1],b[1]);
	nand	(iab[2],a[2],b[2]);
	nand	(iab[3],a[3],b[3]);

endmodule
