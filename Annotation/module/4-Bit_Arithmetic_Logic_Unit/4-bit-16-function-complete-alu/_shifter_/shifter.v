`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:26 05/28/2019 
// Design Name: 
// Module Name:    shifter 
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
module shiftermod(A,C,E,S);
input		[3:0]A;
input		C,E;
output	[3:0]S;
wire		[8:0]w;
wire		Cbar;
	
	not	(Cbar,C);
	and	(w[0],Cbar,A[0]);
	and	(w[5],C,A[1]);
	and	(w[2],Cbar,A[1]);
	and	(w[3],C,A[2]);
	and	(w[8],Cbar,A[2]);
	or		(w[6],w[0],w[3]);
	and	(w[4],A[3],C);
	or		(w[7],w[4],w[2]);
	and	(S[0],w[5],E);
	and	(S[1],w[6],E);
	and	(S[2],w[7],E);
	and	(S[3],w[8],E);
	
endmodule
