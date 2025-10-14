// Lab 3 | 8-bit CL Adder 
`timescale 1ns/1ns
module eight_bit_cla(A, B, C0, S, C8);

input[7:0] A, B;
input C0;
output[7:0] S;
output C8;

wire[7:0] G, P;
wire C1, C2, C3, C4, C5, C6, C7;

assign G = A & B;
assign P = A | B;

assign C1 = G[0] | (P[0] & C0);
assign C2 = G[1] | (P[1] & C1);
assign C3 = G[2] | (P[2] & C2);
assign C4 = G[3] | (P[3] & C3);
assign C5 = G[4] | (P[4] & C4);
assign C6 = G[5] | (P[5] & C5);
assign C7 = G[6] | (P[6] & C6);
assign C8 = G[7] | (P[7] & C7);

assign S[0] = A[0] ^ B[0] ^ C0;
assign S[1] = A[1] ^ B[1] ^ C1;
assign S[2] = A[2] ^ B[2] ^ C2;
assign S[3] = A[3] ^ B[3] ^ C3;
assign S[4] = A[4] ^ B[4] ^ C4;
assign S[5] = A[5] ^ B[5] ^ C5;
assign S[6] = A[6] ^ B[6] ^ C6;
assign S[7] = A[7] ^ B[7] ^ C7;

endmodule
