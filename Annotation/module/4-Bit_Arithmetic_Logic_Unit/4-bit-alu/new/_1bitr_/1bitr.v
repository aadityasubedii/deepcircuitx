`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2022 18:21:09
// Design Name: 
// Module Name: 1bitr
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


module ror4(
    input [3:0] in,
    input [1:0] s,
    output [3:0] out
    );
    assign out = in >> s; 
endmodule
