`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 23:56:53
// Design Name: 
// Module Name: pfatb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pfatb();
reg clk;
reg rst;
reg  [3:0]a;
reg  [3:0]b;
reg cin;
wire[3:0]sum;
wire[3:0]carry;
pfa a1(.clk(clk), .rst(rst), .a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
initial begin
clk<=1'b0;
forever #10 clk<=~clk;
end
initial begin
rst<=1'b1;
#50 rst<=1'b0;
#500 $finish;
end
initial
begin
a<=4'b0000;
b<=4'b0000;
cin<=1'b0;
#500 $finish;
end
always
begin
#20 a<=~a;
end
always
begin
#10 b<=~b;
end
always
begin
#5 cin<=~cin;
end
endmodule
