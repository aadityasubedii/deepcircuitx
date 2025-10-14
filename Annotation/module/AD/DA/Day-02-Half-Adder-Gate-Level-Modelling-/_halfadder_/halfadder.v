`timescale 1ns / 1ps
module halfadder(a,b,s,c);
input a,b;
output s,c;
xor U1(s,a,b);
and U2(c,a,b);
endmodule
