`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:23 05/26/2019 
// Design Name: 
// Module Name:    subtractor 
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

module subtractor(a,b,E,d,bout);
input		[3:0]a;
input		[3:0]b;
input 	E;

output	[3:0]d;
output	bout;


wire d0, d1, d2, d3;
wire		b1,b2,b3;
wire		[20:1]w;


	xor (w[1], a[0],b[0]);
	xor (d0, w[1], 0);
	not (w[2], a[0]);
	and (w[3], b[0], w[2]);
	not (w[4], w[1]);
	and (w[5], w[4],0);
	or  (b1, w[5], w[3]);
	
	xor (w[6], a[1],b[1]);
	xor (d1, w[6], b1);
	not (w[7], a[1]);
	and (w[8], b[1], w[7]);
	not (w[9], w[6]);
	and (w[10], w[9],b1);
	or  (b2, w[10], w[8]);
	
	xor (w[11], a[2],b[2]);
	xor (d2, w[11], b2);
	not (w[12], a[2]);
	and (w[13], b[2], w[12]);
	not (w[14], w[11]);
	and (w[15], w[14],b2);
	or  (b3, w[15], w[13]);
	
	xor (w[16], a[3],b[3]);
	xor (d3, w[16], b3);
	not (w[17], a[3]);
	and (w[18], b[3], w[17]);
	not (w[19], w[16]);
	and (w[20], w[19],b3);
	or  (bout, w[20], w[18]);	

	and (d[0], E, d0);
	and (d[1], E, d1);
	and (d[2], E, d2);
	and (d[3], E, d3);


endmodule

