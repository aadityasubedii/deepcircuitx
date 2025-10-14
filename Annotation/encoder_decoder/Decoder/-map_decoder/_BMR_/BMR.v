`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:48 04/15/2016 
// Design Name: 
// Module Name:    BMR 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BMR(a,b,c,d,e);
input [3:0]a,b;
output [3:0]c,d,e;
wire [3:0]x1,x2,x3;
assign x2 = 4'b1111;
not3 n1(a,x1);
add a1(x1,x2,c);
lshift sh1(b,x3);
subt t1(a,x3,d);
subt t2(a,x3,e);
endmodule

module not3(g,h);
input [3:0]g;
output [3:0]h;
assign h = ~g;
endmodule 


module add(x,y,z);
input [3:0]x,y;
output [3:0]z;
assign z = x + y;
endmodule


module lshift(p,q);
input [3:0]p;
output [3:0]q;
assign q = p << 1;
endmodule 


module subt(r,s,t);
input [3:0]r,s;
output [3:0]t;
assign t = r - s;
endmodule  