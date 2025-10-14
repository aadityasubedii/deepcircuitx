// Lab 3 | 8-bit RC Adder Stuctural Implementation
`include "four_bit_rca.v"
`timescale 1ns/1ns
module eight_bit_rca(A, B, Cin, S, Cout);

input[7:0] A, B;
input Cin;
output[7:0] S;
output Cout;

wire C1;

four_bit_rca f0 (A[3:0], B[3:0], Cin, S[3:0], C1);
four_bit_rca f1 (A[7:4], B[7:4], C1, S[7:4], Cout);

endmodule
