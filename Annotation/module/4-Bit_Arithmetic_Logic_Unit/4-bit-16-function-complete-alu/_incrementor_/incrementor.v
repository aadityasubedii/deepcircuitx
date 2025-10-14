`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:18:39 05/27/2019 
// Design Name: 
// Module Name:    incrementor 
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
module incrementor(A, E, Ia);
	 
input		[3:0]A;
input		E;
output	[3:0]Ia;
wire		[7:0]w;

	xor	(w[0],A[0],1);
	and	(Ia[0],w[0],E);
	and	(w[1],A[0],1);
	
	xor	(w[2],A[1],w[1]);
	and	(Ia[1],w[2],E);
	and	(w[3],A[1],w[1]);

	xor	(w[4],A[2],w[3]);
	and	(Ia[2],w[4],E);
	and	(w[5],A[2],w[3]);

	xor	(w[6],A[3],w[5]);
	and	(Ia[3],w[6],E);
	and	(w[7],A[3],w[5]);	



endmodule
