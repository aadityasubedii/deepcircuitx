`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:14 05/26/2019 
// Design Name: 
// Module Name:    comparator 
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
module comparator(A,B,En,G,E,L);

input		[3:0]A;
input		[3:0]B;
input		En;
output	G,E,L; //(G)A>B, (E)A=B, (L)A<B
wire		[32:0]w;
wire		[3:0]Abar;
wire		[3:0]Bbar;

	not	(Abar[0],A[0]);
	not	(Abar[1],A[1]);
	not	(Abar[2],A[2]);
	not	(Abar[3],A[3]);
	not	(Bbar[0],B[0]);
	not	(Bbar[1],B[0]);
	not	(Bbar[2],B[0]);
	not	(Bbar[3],B[0]);
	
	xor	(w[0],A[0],B[0]);
	xor	(w[1],A[1],B[1]);
	xor	(w[2],A[2],B[2]);
	xor	(w[3],A[3],B[3]);
	and	(w[4],w[0],w[1]);
	and	(w[5],w[2],w[3]);
	and	(w[6],w[5],w[4]);
	and	(E,En,w[6]);
	
	and	(w[7],w[1],w[2]);
	and	(w[8],w[7],w[3]);
	and	(w[9],w[8],Bbar[0]);
	and	(w[10],w[9],A[0]);
	and	(w[11],w[2],w[3]);
	and	(w[12],w[11],Bbar[1]);
	and	(w[13],w[12],A[1]);
	and	(w[14],w[3],Bbar[2]);
	and	(w[15],A[2],w[14]);
	and	(w[16],Bbar[3],A[3]);
	or		(w[17],w[10],w[13]);
	or		(w[18],w[17],w[15]);
	or		(w[19],w[18],w[16]);
	and	(G,En,w[19]);

	and	(w[20],w[1],w[2]);
	and	(w[21],w[20],w[3]);
	and	(w[22],w[21],B[0]);
	and	(w[23],w[22],Abar[0]);
	and	(w[24],w[2],w[3]);
	and	(w[25],w[24],B[1]);
	and	(w[26],w[25],Abar[1]);
	and	(w[27],w[3],B[2]);
	and	(w[28],Abar[2],w[27]);
	and	(w[29],B[3],Abar[3]);
	or		(w[30],w[26],w[23]);
	or		(w[31],w[30],w[28]);
	or		(w[32],w[30],w[31]);
	and	(L,En,w[32]);	

	
endmodule
