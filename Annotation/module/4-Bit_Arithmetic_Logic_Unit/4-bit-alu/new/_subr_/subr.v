`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2022 19:45:59
// Design Name: 
// Module Name: subr
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


module subr(
    input a,
    input b,
    input c,
    output diff,
    output borr
    );
    wire anot;
    
    assign anot = (~a); 
    assign diff = (a ^ b ^ c); 
    assign borr = (anot & b) | (b & c) | (c & anot);
endmodule
