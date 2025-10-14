//Verilog Code for Parallel Adder/Subtractor
module parallel_adder_subtractor(A,B,K,S,Cout,Cin);
input [3:0]A,B;
input K,Cin;
output [3:0]S;
output Cout;

wire b0,b1,b2,b3;
xor(b0,B[0],K);
xor(b1,B[1],K);
xor(b2,B[2],K);
xor(b3,B[3],K);

wire c0,c1,c2;
full_adder_1bit  F0(A[0],b0,Cin,S[0],c0);
full_adder_1bit  F1(A[1],b1,c0,S[1],c1);
full_adder_1bit  F2(A[2],b2,c1,S[2],c2);
full_adder_1bit  F3(A[3],b3,c2,S[3],Cout);

endmodule
