`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:57 05/26/2019 
// Design Name: 
// Module Name:    fulladder 
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

module fulladder(a,b,E,cout,s);
    input	[3:0]a;
	 input	[3:0]b;
	 input	E;
	 output	cout;
	 output	[3:0]s;
	 wire		[12:1]w;
	 wire		c1,c2,c3;
	 wire		s0, s1, s2, s3;
	 
	 xor	(w[1],a[0],b[0]);
	 xor	(s0,w[1],0);
	 and	(w[2],w[1],0);
	 and	(w[3],a[0],b[0]);
	 or	(c1,w[2],w[3]);
	 
	 xor	(w[4],a[1],b[1]);
	 xor	(s1,w[4],c1);
	 and	(w[5],w[4],c1);
	 and	(w[6],a[1],b[1]);
	 or	(c2,w[5],w[6]);
	 
	 xor	(w[7],a[2],b[2]);
	 xor	(s2,w[7],c2);
	 and	(w[8],w[7],c2);
	 and	(w[9],a[2],b[2]);
	 or	(c3,w[8],w[9]);
	 
	 xor	(w[10],a[3],b[3]);
	 xor	(s3,w[10],c3);
	 and	(w[11],w[10],c3);
	 and	(w[12],a[3],b[3]);
	 or	(cout,w[11],w[12]);
	 
	 and (s[0], s0, E);
	 and (s[1], s1, E);
	 and (s[2], s2, E);
	 and (s[3], s3, E);

	 
endmodule
