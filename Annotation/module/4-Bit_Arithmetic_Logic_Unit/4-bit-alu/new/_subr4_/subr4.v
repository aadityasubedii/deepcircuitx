`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2022 19:51:49
// Design Name: 
// Module Name: subr4
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


module subr4(
    input [3:0] A,
    input [3:0] B,
    output [4:0] DIFF
    );
    
    wire c1,c2,c3;
    
    subr s1 (.a(A[0]),.b(B[0]),.c(1'b0),.diff(DIFF[0]),.borr(c1));  
    subr s2 (.a(A[1]),.b(B[1]),.c(c1),.diff(DIFF[1]),.borr(c2));  
    subr s3 (.a(A[2]),.b(B[2]),.c(c2),.diff(DIFF[2]),.borr(c3));  
    subr s4 (.a(A[3]),.b(B[3]),.c(c3),.diff(DIFF[3]),.borr(DIFF[4]));  

endmodule
