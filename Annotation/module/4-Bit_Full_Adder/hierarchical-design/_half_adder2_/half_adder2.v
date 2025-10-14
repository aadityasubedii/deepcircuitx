`timescale 1ns / 1ps
module half_adder2(
    input s,c_in,
    output sum,c_out
    );
    xor(sum, s, c_in);
    and(c_out, s, c_in);
endmodule