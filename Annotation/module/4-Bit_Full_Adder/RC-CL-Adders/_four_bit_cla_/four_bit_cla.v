// Lab 3 | 4-bit CL Adder Behavioral Implementation (smaller propogation delay)
`timescale 1ns/1ns
module four_bit_cla(A, B, C0, S, C4);

input[3:0] A, B;
input C0;
output[3:0] S;
output C4;

wire[3:0] G, P;
wire C1, C2, C3;

assign G = A & B;
assign P = A | B;

assign C1 = G[0] | (P[0] & C0);
assign C2 = G[1] | (P[1] & C1);
assign C3 = G[2] | (P[2] & C2);
assign C4 = G[3] | (P[3] & C3);

assign S[0] = A[0] ^ B[0] ^ C0;
assign S[1] = A[1] ^ B[1] ^ C1;
assign S[2] = A[2] ^ B[2] ^ C2;
assign S[3] = A[3] ^ B[3] ^ C3;

endmodule
