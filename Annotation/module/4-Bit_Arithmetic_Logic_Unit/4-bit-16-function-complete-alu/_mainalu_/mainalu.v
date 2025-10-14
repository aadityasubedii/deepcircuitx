`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:04 05/27/2019 
// Design Name: 
// Module Name:    mainalu 
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


module mainalu(A,B,C,D,a,b,E, andOut, norOut, nandOut, orOut, xorOut, AbarOut, BbarOut, adderOut, Cout, Bout, subtractOut, compGOut, compEOut, compLOut, multiOut, evenAOut, evenBOut, oddAOut, oddBOut, decremOut, incremOut, xnorOut, shiftOut, shiftCon);
input		A,B,C,D;
output	[15:0]E;
wire		Abar,Bbar,Cbar,Dbar;
input 	[3:0]a;
input 	[3:0]b;
output 	[3:0]andOut;
output 	[3:0]norOut;
output	[3:0]nandOut;
output	[3:0]orOut;
output	[3:0]xorOut;
output	[3:0]AbarOut;
output	[3:0]BbarOut;
output	[3:0]adderOut;
output	Cout;
output	Bout;
output	[3:0]subtractOut;
output 	compEOut;
output	compGOut;
output	compLOut;
output	[7:0]multiOut;
output	evenAOut, evenBOut;
output	oddAOut, oddBOut;
output	[3:0]decremOut;
output	[3:0]incremOut;
output	[3:0]xnorOut;
output	[3:0]shiftOut;
input		shiftCon;

	not	(Abar,A);
	not	(Bbar,B);
	not	(Cbar,C);
	not	(Dbar,D);
	
	and	(E[0],Abar,Bbar,Cbar,Dbar);
	and	(E[1],Abar,Bbar,Cbar,D);
	and	(E[2],Abar,Bbar,C,Dbar);
	and	(E[3],Abar,Bbar,C,D);
	and	(E[4],Abar,B,Cbar,Dbar);
	and	(E[5],Abar,B,Cbar,D);
	and	(E[6],Abar,B,C,Dbar);
	and	(E[7],Abar,B,C,D);	
	and	(E[8],A,Bbar,Cbar,Dbar);
	and	(E[9],A,Bbar,Cbar,D);
	and	(E[10],A,Bbar,C,Dbar);
	and	(E[11],A,Bbar,C,D);
	and	(E[12],A,B,Cbar,Dbar);
	and	(E[13],A,B,Cbar,D);
	and	(E[14],A,B,C,Dbar);
	and	(E[15],A,B,C,D);
	
	andgatemod 	theand	(a,b, E[0], andOut);
	norgatemod 	thenor	(a,b, E[1], norOut);
	nandgatemod	thenand	(a,b, E[2], nandOut);
	orgatemod	theor		(a,b, E[3], orOut);
	xorgatemod	thexor	(a,b, E[4], xorOut);
	notgatemod	thenot	(a,b, E[5],AbarOut,BbarOut);
	fulladder	thefadder	(a,b, E[6], Cout, adderOut);
	subtractor	thesubtractor	(a,b, E[7], subtractOut, Bout);
	comparator	thecomparator	(a,b, E[8], compGOut,compEOut, compLOut);
	multiplier	themulti	(a,b, E[9], multiOut);			
	evenparity		theeven	(a,b, E[10], evenAOut, evenBOut);
	oddparity		theodd	(a,b, E[11], oddAOut, oddBOut);
	decrementor thedecrement	(a, E[12],decremOut);
	incrementor theincrement	(a, E[13], incremOut);
	xnormod		thexnor	(a,b,E[14], xnorOut);
	shiftermod		theshift	(a,shiftCon,E[15],shiftOut);
	
endmodule


module andgatemod(a,b,E,ab);
input		[3:0]a;
input		[3:0]b;
input  	E;
wire 		[3:0]w;
output	[3:0]ab;

	and	(w[0],a[0],b[0]);
	and	(w[1],a[1],b[1]);
	and	(w[2],a[2],b[2]);
	and	(w[3],a[3],b[3]);
	
	and	(ab[0],E,w[0]);
	and	(ab[1],E,w[1]);
	and	(ab[2],E,w[2]);
	and	(ab[3],E,w[3]);

endmodule

module norgatemod(a, b, E, is);
input		[3:0]a;
input		[3:0]b;
input		E;
wire		[3:0]w;
output	[3:0]is;

	nor	(w[0],a[0],b[0]);
	nor	(w[1],a[1],b[1]);
	nor	(w[2],a[2],b[2]);
	nor	(w[3],a[3],b[3]);
	
	and	(is[0],E,w[0]);
	and	(is[1],E,w[1]);
	and	(is[2],E,w[2]);
	and	(is[3],E,w[3]);
	
endmodule

module nandgatemod(a,b,E,iab);
input		[3:0]a;
input		[3:0]b;
input		E;
output	[3:0]iab;
wire		[3:0]w;

	nand	(w[0],a[0],b[0]);
	nand	(w[1],a[1],b[1]);
	nand	(w[2],a[2],b[2]);
	nand	(w[3],a[3],b[3]);

	and	(iab[0],w[0],E);
	and	(iab[1],w[1],E);
	and	(iab[2],w[2],E);
	and	(iab[3],w[3],E);

endmodule

module orgatemod(a,b,E,s);
input		[3:0]a;
input		[3:0]b;
input		E;
output	[3:0]s;
wire		[3:0]w;

	or		(w[0],a[0],b[0]);
	or		(w[1],a[1],b[1]);
	or		(w[2],a[2],b[2]);
	or		(w[3],a[3],b[3]);

	and	(s[0],w[0],E);
	and	(s[1],w[1],E);
	and	(s[2],w[2],E);
	and	(s[3],w[3],E);
	
endmodule

module xorgatemod(a,b,E,xs);

input		[3:0]a;
input		[3:0]b;
input		E;
output	[3:0]xs;
wire		[3:0]w;

	xor	(w[0],a[0],b[0]);
	xor	(w[1],a[1],b[1]);
	xor	(w[2],a[2],b[2]);
	xor	(w[3],a[3],b[3]);

	and	(xs[0],w[0],E);
	and	(xs[1],w[1],E);
	and	(xs[2],w[2],E);
	and	(xs[3],w[3],E);

endmodule

module notgatemod(A,B,E,Abar,Bbar);
input		[3:0]A;
input		[3:0]B;
input		E;
output	[3:0]Abar;
output	[3:0]Bbar;
wire		[7:0]w;
	
	not	(w[0],A[0]);
	not	(w[1],A[1]);
	not	(w[2],A[2]);
	not	(w[3],A[3]);

	and	(Abar[0],w[0],E);
	and	(Abar[1],w[1],E);
	and	(Abar[2],w[2],E);
	and	(Abar[3],w[3],E);
	
	not	(w[4],B[0]);
	not	(w[5],B[1]);
	not	(w[6],B[2]);
	not	(w[7],B[3]);	
	
	and	(Bbar[0],w[4],E);
	and	(Bbar[1],w[5],E);
	and	(Bbar[2],w[6],E);
	and	(Bbar[3],w[7],E);
	
endmodule