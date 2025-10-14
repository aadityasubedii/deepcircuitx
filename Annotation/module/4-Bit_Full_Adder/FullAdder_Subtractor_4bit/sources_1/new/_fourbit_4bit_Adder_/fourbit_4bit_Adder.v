`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 13:21:29
// Design Name: 
// Module Name: 4bit_4bit_Adder
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


module fourbit_4bit_Adder(

    input [3:0] i_A, i_B,   //i_A[3], i_A[2], i_A[1], i_A[0]
    input i_Cin,

    output [3:0] o_sum,
    output o_carry
    );

    wire [2:0] w_carry;

    FullAdder FA0(
        .i_A(i_A[0]),
        .i_B(i_B[0]),
        .i_Cin(i_Cin),
        .o_sum(o_sum[0]),
        .o_carry(w_carry[0])
    );

    FullAdder FA1(
        .i_A(i_A[1]),
        .i_B(i_B[1]),
        .i_Cin(w_carry[0]),
        .o_sum(o_sum[1]),
        .o_carry(w_carry[1])
    );

    FullAdder FA2(
        .i_A(i_A[2]),
        .i_B(i_B[2]),
        .i_Cin(w_carry[1]),
        .o_sum(o_sum[2]),
        .o_carry(w_carry[2])
    );

    FullAdder FA3(
        .i_A(i_A[3]),
        .i_B(i_B[3]),
        .i_Cin(w_carry[2]),
        .o_sum(o_sum[3]),
        .o_carry(o_carry)
    );
    
endmodule
