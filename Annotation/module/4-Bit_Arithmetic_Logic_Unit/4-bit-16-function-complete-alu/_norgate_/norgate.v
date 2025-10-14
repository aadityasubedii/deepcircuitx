`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:25 05/26/2019 
// Design Name: 
// Module Name:    norgate 
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
module norgate(a,b,is);
input		[3:0]a;
input		[3:0]b;
output	[3:0]is;

	nor	(is[0],a[0],b[0]);
	nor	(is[1],a[1],b[1]);
	nor	(is[2],a[2],b[2]);
	nor	(is[3],a[3],b[3]);
	
endmodule
