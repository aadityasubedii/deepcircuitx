`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2022 20:01:22
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] in1,
    input [3:0] in2,
    input [2:0] op,
    output [8:0] out
    );
    wire [4:0]a1,a2;
    wire [3:0]a3,a4,a5,a6,a7;
    wire [7:0]a8;
    adder4 elem1 (.A(in1), .B(in2), .SUM(a1));
    subr4 elem2 (.A(in1), .B(in2), .DIFF(a2));
    and4 elem3 (.a(in1), .b(in2), .out(a3));
    exor4 elem4 (.a(in1), .b(in2), .out(a4));
    or4 elem5 (.a(in1), .b(in2), .out(a5));
    rol4 elem6 (.in(in1), .s(in2), .out(a6));
    ror4 elem7 (.in(in1), .s(in2), .out(a7));
    multi4 elem8 (.in1(in1), .in2(in2), .pro(a8));
    mux16 mux (.sel(op), .out(out), .a(a1), .b(a2), .c(a3), .d(a4), .e(a5), .f(a6), .g(a7), .h(a8));
endmodule
