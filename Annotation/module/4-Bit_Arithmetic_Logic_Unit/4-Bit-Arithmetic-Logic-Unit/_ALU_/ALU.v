/* Alaa Mahmoud Ebrahim		20190105
   Rana Ihab Ahmed			20190207
   Omar Khaled Alhaj		20190351
   Group:CS-S2
*/

module mux4(output d, input s1, input s2, input a3, input a2, input a1, input a0);
	wire [3:0] temp;
	and(temp[3], a3, s1, s2);
	and(temp[2], a2, ~s1, s2);
	and(temp[1], a1, s1, ~s2);
	and(temp[0], a0, ~s1, ~s2);
	or(d, temp[3], temp[2], temp[1], temp[0]);
endmodule

module mux2(output d, input s1, input a1, input a0);
	wire [1:0] temp;
	and(temp[0], a0, ~s1); //s1 = 0 ->output
	and(temp[1], a1, s1);	//s1 = 1 -> output
	or(d, temp[1], temp[0]);
endmodule


module half_adder(sum, carry, a, b);
   input a, b;
   output sum, carry;
   xor(sum, a, b);
   and(carry, a, b);
endmodule

module full_adder(sum, carry, x, y, z);
   input x, y, z;
   output sum, carry;
   wire s1, c1, c2;
   half_adder h1(s1, c1, x, y);
   half_adder h2(sum, c2, s1, z);
   or(carry, c1, c2);
endmodule

module arithmeticCircuit(output[4:0]D, input[3:0]A, input[3:0]B, input s1, input s2);
   wire cin;
   wire [3:0] carry;
   wire [3:0] out;
   xor(cin,s1,s2);
   
   //Adding two 4-bit numbers.	//s1=0 , s0=0, cin = 0
   mux4 m1(out[0], s1, s2, 1'b1, 1'b0, ~B[0], B[0]);
   full_adder f1(D[0], carry[0], cin, A[0], out[0]);
   /*initial
   begin
      $monitor("d[0]=%b, carry[0]=%b, cin=%b, out[0]=%b, A[0]=%b", D[0], carry[0], cin, out[0], A[0]);
   end */
   
   //Subtracting two 4-bit numbers.
   mux4 m2(out[1] , s1, s2, 1'b1, 1'b0, ~B[1], B[1]);
   full_adder f2(D[1], carry[1], carry[0], A[1], out[1]);
   
   //Adding 1 to a 4-bit number.
   mux4 m3(out[2], s1, s2, 1'b1, 1'b0, ~B[2], B[2]);
   full_adder f3(D[2], carry[2], carry[1], A[2], out[2]);
   
   //Subtracting 1 from a 4-bit number.
   mux4 m4(out[3], s1, s2, 1'b1, 1'b0, ~B[3], B[3]);
   full_adder f4(D[3] ,carry[3], carry[2], A[3], out[3]);
   
   buf(D[4], carry[3]);
endmodule   

module logicCircuit(input s1, input s2, input [3:0]a, input [3:0]b, output [4:0]outArray);
	//s2 s1
	//00 = XOR, 10 = OR, 01 = XOR, 11 = AND
	wire[3:0] TEMP;
	wire[3:0] AND;
	wire[3:0] OR;
	wire[3:0] XOR;
	//
	and(AND[0], a[0], b[0]);
	and(AND[1], a[1], b[1]);
	and(AND[2], a[2], b[2]);
	and(AND[3], a[3], b[3]);
	//
	or(OR[0], a[0], b[0]);
	or(OR[1], a[1], b[1]);
	or(OR[2], a[2], b[2]);
	or(OR[3], a[3], b[3]);
	//
	xor(XOR[0], a[0], b[0]);
	xor(XOR[1], a[1], b[1]);
	xor(XOR[2], a[2], b[2]);
	xor(XOR[3], a[3], b[3]);
	//
	mux2 m0(TEMP[0], s1, AND[0], OR[0]);
	mux2 m1(TEMP[1], s1, AND[1], OR[1]);
	mux2 m2(TEMP[2], s1, AND[2], OR[2]);
	mux2 m3(TEMP[3], s1, AND[3], OR[3]);
	//
	mux2 m4(outArray[0], s2, TEMP[0], XOR[0]);
	mux2 m5(outArray[1], s2, TEMP[1], XOR[1]);
	mux2 m6(outArray[2], s2, TEMP[2], XOR[2]);
	mux2 m7(outArray[3], s2, TEMP[3], XOR[3]);
	//
	buf(outArray[4], 0);
endmodule

module rightShift(output [4:0]o, input [3:0]a);
	buf(o[3], a[3]);
	buf(o[2], a[3]);
	buf(o[1], a[2]);
	buf(o[0], a[1]);
	buf(o[4], a[3]);
endmodule

module ALU(output [4:0]o, input [3:0]a, input [3:0]b, input s4, input s3, input s2, input s1);
	wire [4:0] ar;
	arithmeticCircuit arc(ar, a, b, s1, s2);
	wire [4:0]l;
	logicCircuit Logic(s1, s2, a, b, l);
	wire [4:0]shift;
	rightShift r(shift, a);
	wire [4:0]temp;
	
	mux2 m0(temp[0], s3, l[0], ar[0]);		//s4  s3
	mux2 m1(o[0], s4, shift[0], temp[0]);	//0	   0	arithmetic
											//0	   1	logic
	mux2 m2(temp[1], s3, l[1], ar[1]);		//1	   x	shift
	mux2 m3(o[1], s4, shift[1], temp[1]);
	
	mux2 m4(temp[2], s3, l[2], ar[2]);
	mux2 m5(o[2], s4, shift[2], temp[2]);
	
	mux2 m6(temp[3], s3, l[3], ar[3]);
	mux2 m7(o[3], s4, shift[3], temp[3]);
	
	mux2 m8(temp[4], s3, l[4], ar[4]);
	mux2 m9(o[4], s4, shift[4], temp[4]);
	
endmodule
	

module main();
   wire [3:0] A = 4'b0110;
   wire s1 = 0;
   wire s2 = 0;
   wire s3 = 0;
   wire s4 = 1;
   wire [4:0]d;
   wire [3:0]b = 4'b0111;

   ALU a(d, A, b, s4, s3, s2, s1);
   initial
   begin
      $monitor("d[4]=%b, d[3]=%b, d[2]=%b, d[1]=%b, d[0]=%b", d[4], d[3], d[2], d[1], d[0]);
   end
endmodule
