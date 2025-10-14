`timescale 1ns / 1ps

module HalfAdder(
    input i_A,
    input i_B,
    output o_sum, o_carry
);
    
    assign o_sum = i_A ^ i_B;
    assign o_carry = i_A & i_B;

endmodule
