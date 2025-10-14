// Lab 4 | 4-bit RC Adder/Subtractor
`include "full_adder.v"
module four_bit_rca(A, B, S, Cout, dir, overflow);

input[3:0] A, B;
input dir;
output overflow;
output[3:0] S, Cout;

wire net0, net1, net2, net3;

// Addition or Subtraction 
xor(net0, B[0], dir);
xor(net1, B[1], dir);
xor(net2, B[2], dir);
xor(net3, B[3], dir);

// Overflow Calculation
xor(overflow, Cout[2], Cout[3]);

// Ripple Carry Adders
full_adder FA0 (.A(A[0]), .B(net0), .Cin(dir), .S(S[0]), .Cout(Cout[0]));
full_adder FA1 (.A(A[1]), .B(net1), .Cin(Cout[0]), .S(S[1]), .Cout(Cout[1]));
full_adder FA2 (.A(A[2]), .B(net2), .Cin(Cout[1]), .S(S[2]), .Cout(Cout[2]));
full_adder FA3 (.A(A[3]), .B(net3), .Cin(Cout[2]), .S(S[3]), .Cout(Cout[3]));
endmodule 
