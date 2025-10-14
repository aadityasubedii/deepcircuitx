`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:02 05/26/2019 
// Design Name: 
// Module Name:    multiplier 
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

module multiplier(A,B, E,p);

input		[3:0]A;
input		[3:0]B;
//input		cin;
input		E;
output	[7:0]p;
wire		[9:0]c;
wire		[11:0]a;
wire		[11:0]b;
wire		[35:0]w;
wire		[7:0]pWire;

		 and	(pWire[0],A[0],B[0]);
		 and	(b[0],A[1],B[0]);
		 and	(b[1],A[2],B[0]);
		 and	(b[2],A[3],B[0]);
		 and	(a[0],A[0],B[1]);
		 and	(a[1],A[1],B[1]);
		 and	(a[2],A[2],B[1]);
		 and	(a[3],A[3],B[1]);
		 
				 xor	(w[0],a[0],b[0]);
				 xor	(pWire[1],w[0],0);
				 and	(w[1],w[0],cin);
				 and	(w[2],a[0],b[0]);
				 or	(c[0],w[1],w[2]);
				 
				 xor	(w[3],a[1],b[1]);
				 xor	(b[4],w[3],c[0]);
				 and	(w[4],w[3],c[0]);
				 and	(w[5],a[1],b[1]);
				 or	(c[1],w[5],w[4]);
				 
				 xor	(w[6],a[2],b[2]);
				 xor	(b[5],w[6],c[1]);
				 and	(w[7],w[6],c[1]);
				 and	(w[8],a[2],b[2]);
				 or	(c[2],w[8],w[7]);
				 
				 xor	(w[9],a[3],b[3]);
				 xor	(b[6],w[9],c[2]);
				 and	(w[10],w[9],c[2]);
				 and	(w[11],a[3],b[3]);
				 or	(b[7],w[11],w[10]);
		 
		 and	(a[4],A[0],B[2]);
		 and	(a[5],A[1],B[2]);
		 and	(a[6],A[2],B[2]);
		 and	(a[7],A[3],B[2]);	

				 xor	(w[12],a[4],b[4]);
				 xor	(pWire[2],w[12],0);
				 and	(w[13],w[12],cin);
				 and	(w[14],a[4],b[4]);
				 or	(c[3],w[13],w[14]);
				 
				 xor	(w[15],a[5],b[5]);
				 xor	(b[8],w[15],c[3]);
				 and	(w[16],w[15],c[3]);
				 and	(w[17],a[5],b[5]);
				 or	(c[4],w[16],w[17]);
				 
				 xor	(w[18],a[6],b[6]);
				 xor	(b[9],w[18],c[4]);
				 and	(w[19],w[18],c[4]);
				 and	(w[20],a[6],b[6]);
				 or	(c[5],w[19],w[20]);
				 
				 xor	(w[21],a[7],b[7]);
				 xor	(b[10],w[21],c[5]);
				 and	(w[22],w[21],c[5]);
				 and	(w[23],a[7],b[7]);
				 or	(b[11],w[23],w[22]);
				 

		 and	(a[8],A[0],B[3]);
		 and	(a[9],A[1],B[3]);
		 and	(a[10],A[2],B[3]);
		 and	(a[11],A[3],B[3]);	

				 xor	(w[24],a[8],b[8]);
				 xor	(pWire[3],w[24],0);
				 and	(w[25],w[24],cin);
				 and	(w[26],a[8],b[8]);
				 or	(c[6],w[25],w[26]);
				 
				 xor	(w[27],a[9],b[9]);
				 xor	(pWire[4],w[27],c[6]);
				 and	(w[28],w[27],c[6]);
				 and	(w[29],a[9],b[9]);
				 or	(c[7],w[28],w[29]);
				 
				 xor	(w[30],a[10],b[10]);
				 xor	(pWire[5],w[30],c[8]);
				 and	(w[31],w[30],c[8]);
				 and	(w[32],a[10],b[10]);
				 or	(c[9],w[31],w[32]);
				 
				 xor	(w[33],a[11],b[11]);
				 xor	(pWire[6],w[33],c[9]);
				 and	(w[34],w[33],c[9]);
				 and	(w[35],a[11],b[11]);
				 or	(pWire[7],w[34],w[35]);
				 
				 
				 and(p[0],E, pWire[0]);
				 and(p[1],E, pWire[1]);
				 and(p[2],E, pWire[2]);
				 and(p[3],E, pWire[3]);
				 and(p[4],E, pWire[4]);
				 and(p[5],E, pWire[5]);
				 and(p[6],E, pWire[6]);
				 and(p[7],E, pWire[7]);
				 

endmodule
