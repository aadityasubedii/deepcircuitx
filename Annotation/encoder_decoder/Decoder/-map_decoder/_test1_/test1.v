module test1(a,b,c);
input wire[3:0]a[1:0];
input wire[3:0]b[1:0];
output wire[3:0]c[1:0];
adda ad1(a[0],b[0],c[0]);
adda ad2(a[1],b[1],c[1]);
endmodule
module adda(x,y,z);
input [3:0]x,y;
output reg[3:0]z;
always@(*)
            z <= x + y;
endmodule