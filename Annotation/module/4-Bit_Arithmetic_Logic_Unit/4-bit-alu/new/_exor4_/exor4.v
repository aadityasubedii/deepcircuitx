`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2022 06:46:39
// Design Name: 
// Module Name: exor4
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


module exor4(
    input [3:0] a,
    input [3:0] b,
    output [3:0] out
    );
    xor xor0 (out[0],a[0],b[0]);
    xor xor1 (out[1],a[1],b[1]);
    xor xor2 (out[2],a[2],b[2]);
    xor xor3 (out[3],a[3],b[3]);
    
endmodule
