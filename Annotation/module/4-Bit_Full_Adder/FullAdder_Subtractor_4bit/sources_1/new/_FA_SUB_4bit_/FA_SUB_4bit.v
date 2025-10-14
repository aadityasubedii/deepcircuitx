`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 15:34:14
// Design Name: 
// Module Name: FA_SUB_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// git
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA_SUB_4bit(
    input [3:0] i_A, i_B,
    input i_mode,

    output [3:0] o_sum,
    output o_carry
    );

    wire [2:0] w_carry;
    wire [3:0] w_i_B;

    assign w_i_B = {4{i_mode}} ^ i_B;       // 반복연산자, i_mode와 4번 반복해서 만들겠다. 아래 2줄과 같은 효과
    // assign w_i_B = 4'b1111 ^ i_B;        
    // assign w_i_B = 4'b0000 ^ i_B;        

    // assign w_i_B[0] = i_B[0] ^ i_mode;
    // assign w_i_B[1] = i_B[1] ^ i_mode;
    // assign w_i_B[2] = i_B[2] ^ i_mode;
    // assign w_i_B[3] = i_B[3] ^ i_mode;

    fourbit_4bit_Adder FA_SUB(
        .i_A(i_A),
        .i_B(w_i_B),
        .i_Cin(i_mode),
        .o_sum(o_sum),
        .o_carry(o_carry)
    );

    // FullAdder FA_SUB_0(
    //     .i_A(i_A[0]),
    //     .i_B(w_i_B[0]),
    //     .i_Cin(i_mode),
    //     .o_sum(o_sum[0]),
    //     .o_carry(w_carry[0])
    // );

    // FullAdder FA_SUB_1(
    //     .i_A(i_A[1]),
    //     .i_B(w_i_B[1]),
    //     .i_Cin(w_carry[0]),
    //     .o_sum(o_sum[1]),
    //     .o_carry(w_carry[1])
    // );

    // FullAdder FA_SUB_2(
    //     .i_A(i_A[2]),
    //     .i_B(w_i_B[2]),
    //     .i_Cin(w_carry[1]),
    //     .o_sum(o_sum[2]),
    //     .o_carry(w_carry[2])
    // );

    // FullAdder FA_SUB_3(
    //     .i_A(i_A[3]),
    //     .i_B(w_i_B[3]),
    //     .i_Cin(w_carry[2]),
    //     .o_sum(o_sum[3]),
    //     .o_carry(o_carry)
    // );

endmodule
