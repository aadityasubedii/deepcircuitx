`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:17 05/26/2019 
// Design Name: 
// Module Name:    decoder 
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
module decoder(A,B,C,D,E);
input		A,B,C,D;
output	[15:0]E;
wire		Abar,Bbar,Cbar,Dbar;

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
	
endmodule
