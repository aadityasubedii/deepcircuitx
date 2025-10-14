`timescale 1ns / 1ps
module fulladder_tb;
reg a,b,cin;
wire sum,c_out;
fulladder DUT(.a(a),.b(b),.cin(cin),.sum(sum),.c_out(c_out));
initial 
begin
     a=1'b0;   b=1'b0;   cin=1'b0;
#20  a=1'b0;   b=1'b0;   cin=1'b1;
#20  a=1'b0;   b=1'b1;   cin=1'b0;
#20  a=1'b0;   b=1'b1;   cin=1'b1;
#20  a=1'b1;   b=1'b0;   cin=1'b0;
#20  a=1'b1;   b=1'b0;   cin=1'b1;
#20  a=1'b1;   b=1'b1;   cin=1'b0;
#20  a=1'b1;   b=1'b1;   cin=1'b1;
end
endmodule
