module BSMCU(
//input clock,
input signed[11:0]i11,i15,i21,i25,i32,i36,i42,i46,i53,i57,i63,i67,i74,i78,i84,i88,b1,b2,b3,b4,b5,b6,b7,b8,
output signed [11:0]bl1,bl2,bl3,bl4,bl5,bl6,bl7,bl8);
ACS c1(i11,b1,i15,b5,bl1);
ACS c2(i21,b1,i25,b5,bl2);
ACS c3(i32,b2,i36,b6,bl3);
ACS c4(i42,b2,i46,b6,bl4);
ACS c5(i53,b3,i57,b7,bl5);
ACS c6(i63,b4,i67,b7,bl6);
ACS c7(i74,b4,i78,b8,bl7);
ACS c8(i84,b4,i88,b8,bl8);
endmodule

module ACS(w1,w2,w3,w4,w5);
input signed [11:0]w1,w2,w3,w4;
output signed [11:0] w5;
wire signed [11:0] d1,d2;
adda ad1(w1,w2,d1);
adda ad2(w3,w4,d2);
cmp cm1(d1,d2,w5);
endmodule

module adda(x1,x2,x3);
input signed [11:0]x1,x2;
output signed [11:0]x3;
assign   x3 = x1 + x2;
endmodule 


module cmp(y1,y2,y3);
input signed [11:0]y1,y2;
output reg signed[11:0]y3;
always@(y1 or y2)
begin 
        if(y1 > y2)
                y3 <= y1;
        else
                y3 <= y2;
end
endmodule