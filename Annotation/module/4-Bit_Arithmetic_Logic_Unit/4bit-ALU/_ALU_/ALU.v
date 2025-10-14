/* 
		4 bit ripple carry adder
		27/05/2018
		group A7

		This implementation can be used to do addition, substraction, multiplication, 2's complementation, as well as AND,OR,XOR 			operations between two 4 bit numbers. A and B.
*/

module full_adder(a,b,cin,s,cout); // Full adder module for ripple carry 4 bit adder
	output s,cout; 
	wire w1,w2,w3; 
	input a,b,cin; 
	xor(w1,a,b);
	xor(s,w1,cin);
	and(w2,a,b);
	and(w3,w1,cin);
	or(cout,w3,w2);
endmodule

module ripple_carry_adder(a,b,s,cin,cout); // ripple carry adder control inputs are 0 1 0
	input [3:0] a,b;
	input cin;
	output cout;
	output [3:0] s;
	wire carry1,carry2,carry3;
	full_adder fa0(a[0],b[0],cin,s[0],carry1);
	full_adder fa1(a[1],b[1],carry1,s[1],carry2);
	full_adder fa2(a[2],b[2],carry2,s[2],carry3);
	full_adder fa3(a[3],b[3],carry3,s[3],cout);
endmodule

module twos_complement(A,Z); // Twos complement of a 4 bit number
	input [3:0] A; 	//	0 0 1 for 2's complement of A	
	output [3:0] Z; //	0 1 0 for 2's complement of B
	output cout;
	wire  a0,a1,a2,a3;
	not(a0,A[0]);
	not(a1,A[1]);
	not(a2,A[2]);
	not(a3,A[3]);
	wire [3:0] in;
	assign in[0]=a0;
	assign in[1]=a1;
	assign in[2]=a2;
	assign in[3]=a3;
	ripple_carry_adder fa0(in,4'b0001,Z,1'b0,cout);
endmodule

module multiplication(a,b,c); // 4 bit multiplier. 1 0 0 is the control input 
	input [3:0] a,b;
	output [3:0] c;
	wire [3:0] bus1,bus2,bus3,bus4,add1,add2,add3,add4,add5;
	and(c[0],b[0],a[0]); 
	and(bus1[0],b[1],a[0]);
	and(bus1[1],b[2],a[0]);
	and(bus1[2],b[3],a[0]);
	assign bus1[3]=1'b0;

	and(bus2[0],b[0],a[1]);
	and(bus2[1],b[1],a[1]);
	and(bus2[2],b[2],a[1]);
	and(bus2[3],b[3],a[1]);

	and(bus3[0],b[0],a[2]);
	and(bus3[1],b[1],a[2]);
	and(bus3[2],b[2],a[2]);	
	and(bus3[3],b[3],a[2]);

	and(bus4[0],b[0],a[3]);
	and(bus4[1],b[1],a[3]);
	and(bus4[2],b[2],a[3]);
	and(bus4[3],b[3],a[3]);

	wire co1,co2,co3;
	ripple_carry_adder fa0(bus1,bus2,add1,1'b0,co1);
	assign c[1]=add1[0];
	assign add2[3]=co1;
	assign add2[2]=add1[3];
	assign add2[1]=add1[2];
	assign add2[0]=add1[1];

	ripple_carry_adder fa1(add2,bus3,add3,1'b0,co2);
	assign c[2]=add3[0];
	assign add4[3]=co2;
	assign add4[2]=add3[3];
	assign add4[1]=add3[2];
	assign add4[0]=add3[1];

	ripple_carry_adder fa2(add4,bus4,add5,1'b0,co3);
	assign c[3]=add5[0];

endmodule

module mux_8to_1(out,i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2); // 8:1 multiplexer 
	input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
	output out;
	wire w1,w2,w3,w4,w5,w6,w7,w8,s00,s01,s02;
	not(s00,s0);
	not(s01,s1);
	not(s02,s2);
	and(w1,i0,s00,s01,s02);
	and(w2,i1,s00,s01,s2);
	and(w3,i2,s00,s1,s02);
	and(w4,i3,s00,s1,s2);
	and(w5,i4,s0,s01,s02);
	and(w6,i5,s0,s01,s2);
	and(w7,i6,s0,s1,s02);
	and(w8,i7,s0,s1,s2);
	or(out,w1,w2,w3,w4,w5,w6,w7,w8);
endmodule

module AND(a,b,c);    //	AND operation of A and B. Control input is 1 0 1
	input [3:0] a,b;
	output [3:0] c;
	and(c[0],a[0],b[0]);	
	and(c[1],a[1],b[1]);
	and(c[2],a[2],b[2]);
	and(c[3],a[3],b[3]);
endmodule

module OR(a,b,c); // 		OR operation of A and B. Control input is 1 1 0
	input [3:0] a,b;
	output [3:0] c;
	or(c[0],a[0],b[0]);	
	or(c[1],a[1],b[1]);
	or(c[2],a[2],b[2]);
	or(c[3],a[3],b[3]);
endmodule


module substract(A,B,C); // 4 bit substraction. control input is 0 1 1
	input [3:0] A,B;
	output [3:0] C;
	output cout;
	wire [3:0] out;
	twos_complement fa1(B,out);
	ripple_carry_adder fa0(A,out,C,1'b0,cout);
endmodule
module XOR(a,b,c); // 		XoR operation between A and B. control input is 1 1 1 
	input [3:0] a,b; output [3:0] c;
	xor(c[0],a[0],b[0]);
	xor(c[1],a[1],b[1]);
	xor(c[2],a[2],b[2]);
	xor(c[3],a[3],b[3]);
endmodule


module ALU(a,b,outp1,outp2,outp3,outp4,s0,s1,s2);
	input [3:0] a,b;
	input s0,s1,s2;
	output cout;
	wire [3:0] c1,c2,c3,c4,c5,c6,c7,c8;
	output outp1,outp2,outp3,outp4;
	twos_complement fa0(a,c1);
	twos_complement fa1(b,c2);
	ripple_carry_adder fa2(a,b,c3,1'b0,cout);
	substract fa3(a,b,c4);
	multiplication fa4(a,b,c5);
	AND fa5(a,b,c6);
	OR fa6(a,b,c7);
	XOR fa7(a,b,c8);
	mux_8to_1 b0(outp1,c1[3],c2[3],c3[3],c4[3],c5[3],c6[3],c7[3],c8[3],s0,s1,s2);
	mux_8to_1 b1(outp2,c1[2],c2[2],c3[2],c4[2],c5[2],c6[2],c7[2],c8[2],s0,s1,s2);	
	mux_8to_1 b2(outp3,c1[1],c2[1],c3[1],c4[1],c5[1],c6[1],c7[1],c8[1],s0,s1,s2);
	mux_8to_1 b3(outp4,c1[0],c2[0],c3[0],c4[0],c5[0],c6[0],c7[0],c8[0],s0,s1,s2);
endmodule
/* ********************************************************************************************************************************* */
/* ********************************************************************************************************************************* */
module stimulus;
	reg [3:0] a,b;
	reg s0,s1,s2;
	wire opt1,opt2,opt3,opt4;
	ALU my(a,b,opt1,opt2,opt3,opt4,s0,s1,s2);
	initial	
	begin
		s0=1;s1=1;s2=1;
		a<= 4'b1011;
		b<= 4'b0010;	
		#1 
		$display("s0 = %b , s1 = %b , s2 = %b\n",s0,s1,s2);
		$display("ANSWER = %b %b %b %b\n",opt1,opt2,opt3,opt4);
		
	end
endmodule
	
 
	
