`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2022 19:29:45
// Design Name: 
// Module Name: 4_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder4(
    input [3:0] A,
    input [3:0] B,
    output [4:0] SUM
    );
    
    wire c1,c2,c3;
    
    full_adder a1 (.a(A[0]),.b(B[0]),.c(1'b0),.sum(SUM[0]),.carry(c1));
    full_adder a2 (.a(A[1]),.b(B[1]),.c(c1),.sum(SUM[1]),.carry(c2));
    full_adder a3 (.a(A[2]),.b(B[2]),.c(c2),.sum(SUM[2]),.carry(c3));
    full_adder a4 (.a(A[3]),.b(B[3]),.c(c3),.sum(SUM[3]),.carry(SUM[4]));
        

endmodule
