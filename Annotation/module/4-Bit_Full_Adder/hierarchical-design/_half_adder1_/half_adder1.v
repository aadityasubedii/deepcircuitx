`timescale 1ns / 1ps
module half_adder1(
    input a_in, b_in,
    output s, c
    );
    xor(s, a_in, b_in);
    and(c, a_in, b_in);
endmodule