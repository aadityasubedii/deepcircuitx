`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:20 11/19/2019 
// Design Name: 
// Module Name:    encoder42 
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
module encoder42(
    input D0,
    input D1,
    input D2,
    input D3,
    output Q0,
    output Q1,
	 output V
    );
wire a1, nD1;

not(nD1, D1);
and(a1, nD1, D2);

or(Q0, D0, D1);
or(Q1, a1, D0);
or(V, D0, D1, D2, D3);


endmodule
