`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunavant
// 
// Create Date: 22.07.2023 05:36:05
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(input [3:0] a,
                          input [3:0] b,
                          input [3:0] cin,
                          output [3:0] sum,
                          output [3:0] carry);
    full_adder FA1 (a[0], b[0], cin[0], sum[0], carry[0]);
    full_adder FA2 (a[1], b[1], cin[1], sum[1], carry[1]);
    full_adder FA3 (a[2], b[2], cin[2], sum[2], carry[2]);
    full_adder FA4 (a[3], b[3], cin[3], sum[3], carry[3]);
endmodule
