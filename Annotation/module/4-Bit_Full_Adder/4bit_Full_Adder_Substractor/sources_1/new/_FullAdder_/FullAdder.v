`timescale 1ns / 1ps

module FullAdder(
    input i_A, i_B, i_Cin,
    output o_Sum, o_Cout
    );

    wire w_sum_0, w_carry_0, w_carry_1;
    
    HalfAdder HA0(
    .i_A(i_A),
    .i_B(i_B),
    .o_sum(w_sum_0),
    .o_carry(w_carry_0)
    );

    HalfAdder HA1(
    .i_A(w_sum_0),
    .i_B(i_Cin),
    .o_sum(o_Sum),
    .o_carry(w_carry_1)
    );

    assign o_Cout = w_carry_0 ^ w_carry_1;

endmodule
