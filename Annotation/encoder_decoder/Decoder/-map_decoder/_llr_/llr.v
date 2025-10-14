module LLR_final(
input clock,
input [11:0]a1,a2,a3,a4,a5,a6,a7,a8,b1,b2,b3,b4,b5,b6,b7,b8,y11,y15,y21,y25,y32,y36,y42,y46,y53,y57,y63,y67,y74,y78,y84,y88,
output LLR);
wire [11:0]w11,w15,w21,w25,w32,w36,w42,w46,w53,w57,w63,w67,w74,w78,w84,w88,op1,op2;

adder_3 ader1(a1,y11,b1,w11);
adder_3 ader2(a1,y15,b5,w15);
adder_3 ader3(a2,y21,b1,w21);
adder_3 ader4(a2,y25,b5,w25);
adder_3 ader5(a3,y32,b2,w32);
adder_3 ader6(a3,y36,b6,w36);
adder_3 ader7(a4,y42,b2,w42);
adder_3 ader8(a4,y46,b6,w46);
adder_3 ader9(a5,y53,b3,w53);
adder_3 ader10(a5,y57,b7,w57);
adder_3 ader11(a6,y63,b3,w63);
adder_3 ader12(a6,y67,b7,w67);
adder_3 ader13(a7,y74,b4,w74);
adder_3 ader14(a7,y78,b8,w78);
adder_3 ader15(a8,y84,b4,w84);
adder_3 ader16(a8,y88,b8,w88);
magn_cmp mg1(w11,w25,w36,w42,w53,w67,w78,w84,op1);
magn_cmp mg2(w15,w21,w32,w46,w57,w63,w74,w88,op2);
f_out out(op1,op2,LLR);

endmodule


module adder_3(a,b,c,d);
input [11:0]a,b,c;
output [11:0]d;
assign d = a + b + c;
endmodule

module magn_cmp(a,b,c,d,e,f,g,h,i);
input [11:0]a,b,c,d,e,f,g,h;
output [11:0]i;
wire [11:0]r1,r2,r3,r4,r5,r6;
cmp cmp1(a,b,r1);
cmp cmp2(r1,c,r2);
cmp cmp3(r2,d,r3);
cmp cmp4(r3,e,r4);
cmp cmp5(r4,f,r5);
cmp cmp6(r5,g,r6);
cmp cmp7(r6,h,i);
endmodule 

module f_out(
input [11:0]b,d,
output reg c);
always@(d or b)
begin
    if(b < d)
      c <= 1'b1;
  else
      c <= 1'b0;
end
endmodule