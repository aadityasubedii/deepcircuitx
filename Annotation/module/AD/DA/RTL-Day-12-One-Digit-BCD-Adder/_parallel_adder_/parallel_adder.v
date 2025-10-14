//Verilog Code for Parallel Adder/4 Bit Adder
module parallel_adder(A,B,Cin,S,Cout);
input [3:0]A,B;
input Cin;
output [3:0]S;
output Cout;

wire c0,c1,c2;
full_adder_1bit  F0(A[0],B[0],Cin,S[0],c0);
full_adder_1bit  F1(A[1],B[1],c0,S[1],c1);
full_adder_1bit  F2(A[2],B[2],c1,S[2],c2);
full_adder_1bit  F3(A[3],B[3],c2,S[3],Cout);

endmodule
