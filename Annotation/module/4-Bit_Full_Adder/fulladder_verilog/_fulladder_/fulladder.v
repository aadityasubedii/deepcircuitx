module fulladder(s,co,a,b,ci);
	input wire a,b,ci;
	output wire s,co;
	assign s=(a^b)^ci;
	assign co=((a^b)&ci)|(a&b);
endmodule

module fulladder_4bit(S,Co,A,B,Ci);
	input A,B,Ci;
	output S,Co;
	wire [3:0]A,B,S;
	wire Ci,Co;
	wire i1,i2,i3;
	fulladder fa0(S[0],i1,A[0],B[0],Ci);
	fulladder fa1(S[1],i2,A[1],B[1],i1);
	fulladder fa2(S[2],i3,A[2],B[2],i2);
	fulladder fa3(S[3],Co,A[3],B[3],i3);
endmodule

