`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:03 05/26/2019 
// Design Name: 
// Module Name:    notgate 
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
module notgate(A,B,Abar,Bbar);
input		[3:0]A;
input		[3:0]B;
output	[3:0]Abar;
output	[3:0]Bbar;
	
	not	(Abar[0],A[0]);
	not	(Abar[1],A[1]);
	not	(Abar[2],A[2]);
	not	(Abar[3],A[3]);
	
	not	(Bbar[0],B[0]);
	not	(Bbar[1],B[1]);
	not	(Bbar[2],B[2]);
	not	(Bbar[3],B[3]);	
	
endmodule
