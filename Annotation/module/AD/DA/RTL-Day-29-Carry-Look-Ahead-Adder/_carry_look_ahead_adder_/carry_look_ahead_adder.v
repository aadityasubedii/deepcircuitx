//Verilog Code for Carry Look Ahead Adder
module carry_look_ahead_adder(A,B,Cin,S,Cout);
input [3:0]A,B;
input Cin;
output [3:0]S;
output Cout;

wire C1,C2,C3;

full_adder_1bit  F0(A[0],B[0],Cin,S[0]);
full_adder_1bit  F1(A[1],B[1],C1,S[1]);
full_adder_1bit  F2(A[2],B[2],C2,S[2]);
full_adder_1bit  F3(A[3],B[3],C3,S[3]);

wire [3:0]P,G;

assign P[0]=A[0]^B[0];
assign P[1]=A[1]^B[1];
assign P[2]=A[2]^B[2];
assign P[3]=A[3]^B[3];

assign G[0]=A[0]&B[0];
assign G[1]=A[1]&B[1];
assign G[2]=A[2]&B[2];
assign G[3]=A[3]&B[3];

assign C1=G[0]|(P[0]&Cin);
assign C2=G[1]|(P[1]&G[0])|(P[1]&P[0]&Cin);
assign C3=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&Cin);
assign Cout=G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&Cin);

endmodule
