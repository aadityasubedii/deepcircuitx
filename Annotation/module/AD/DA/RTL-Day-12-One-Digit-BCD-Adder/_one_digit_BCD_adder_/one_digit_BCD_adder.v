//Verilog Code for One Digit BCD Adder
module one_digit_BCD_adder(A,B,Cin,S,C);

input [3:0]A,B;
input Cin;

output [3:0]S;
output C;

wire [3:0]Z;
wire K;
  
parallel_adder P1(.A(A),.B(B),.Cin(Cin),.S(Z),.Cout(K));
// Correction Logic for BCD Addition
wire w1,w2;
and A1(w1,Z[1],Z[3]);
and A2(w2,Z[2],Z[3]);

or O1(C,w1,w2,K);

wire [3:0]CF;
assign CF={1'b0,C,C,1'b0};

parallel_adder P2(.A(CF),.B(Z),.Cin(Cin),.S(S));

endmodule
