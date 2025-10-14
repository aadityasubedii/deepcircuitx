`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:07:47 05/27/2019 
// Design Name: 
// Module Name:    decrementor 
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
module decrementor(A, E,Da);

input		[3:0]A;
input		E;
output	[3:0]Da;
wire		[19:0]w;

	xor	(w[0],A[0],1);
	xor	(w[1],w[0],0);
	and	(w[2],w[0],0);
	and	(w[3],A[0],1);
	or		(w[4],w[2],w[3]);
	and	(Da[0],E,w[1]);
	
	xor	(w[5],A[1],1);
	xor	(w[6],w[5],w[4]);
	and	(w[7],w[5],w[4]);
	and	(w[8],A[1],1);
	or		(w[9],w[7],w[8]);
	and	(Da[1],E,w[6]);

	xor	(w[10],A[2],1);
	xor	(w[11],w[10],w[9]);
	and	(w[12],w[10],w[9]);
	and	(w[13],A[2],1);
	or		(w[14],w[12],w[13]);
	and	(Da[2],E,w[11]);

	xor	(w[15],A[3],1);
	xor	(w[16],w[15],w[14]);
	and	(w[17],w[15],w[14]);
	and	(w[18],A[3],1);
	or		(w[19],w[17],w[18]);
	and	(Da[3],E,w[16]);


endmodule
