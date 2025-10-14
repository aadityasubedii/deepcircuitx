`timescale 1ns / 1ps
module fulladder(sum,c_out,a,b,cin);
output sum,c_out;
input a,b,cin;
wire O1,O2,O3;
xor u1(O1,a,b);
xor u2(sum,O1,cin);
and u3(O2,O1,cin);
and u4(O3,a,cin);
or u5(c_out,a,b);
endmodule
