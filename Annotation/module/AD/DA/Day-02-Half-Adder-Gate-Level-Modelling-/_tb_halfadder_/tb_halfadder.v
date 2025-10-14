`timescale 1ns / 1ps
module halfadder_tb;
reg a,b;
wire s,c;
halfadder U1(.a(a),.b(b),.s(s),.c(c));
initial
begin
a=1'b0;
b=1'b0;
#45
a=1'b0;
b=1'b1;
#45
a=1'b1;
b=1'b0;
#45
a=1'b1;
b=1'b1;
end
endmodule
