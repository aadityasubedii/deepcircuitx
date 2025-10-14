`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 11:33:56
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input i_A, i_B, i_Cin,

    output o_sum, o_carry
    );

    wire w_sum0, w_carry0, w_carry1;

    HalfAdder HA0(
        .i_A(i_A),
        .i_B(i_B),
        .o_sum(w_sum0),
        .o_carry(w_carry0)
    );

    HalfAdder HA1(
        .i_A(w_sum0),
        .i_B(i_Cin),
        .o_sum(o_sum),
        .o_carry(w_carry1)
    );

    assign o_carry = w_carry0 | w_carry1;

endmodule
