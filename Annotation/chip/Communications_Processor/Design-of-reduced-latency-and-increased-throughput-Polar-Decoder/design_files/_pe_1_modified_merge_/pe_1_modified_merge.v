`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 16:26:17
// Design Name: 
// Module Name: pe_1
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


module pe_1_modified(input [7:0] x,y, output [7:0] s, d, output bout_n);
wire [8:1] b;
wire [8:1] c;

half_adder_subtractor has1(.x(x[0]), .y(y[0]), .sum(s[0]), .diff(d[0]), .cout(c[1]), .bout(b[1]));
full_adder_subtractor fas1(.x(x[1]), .y(y[1]), .bin(b[1]), .cin(c[1]), .sum(s[1]), .diff(d[1]), .cout(c[2]), .bout(b[2]));
full_adder_subtractor fas2(.x(x[2]), .y(y[2]), .bin(b[2]), .cin(c[2]), .sum(s[2]), .diff(d[2]), .cout(c[3]), .bout(b[3]));
full_adder_subtractor fas3(.x(x[3]), .y(y[3]), .bin(b[3]), .cin(c[3]), .sum(s[3]), .diff(d[3]), .cout(c[4]), .bout(b[4]));
full_adder_subtractor fas4(.x(x[4]), .y(y[4]), .bin(b[4]), .cin(c[4]), .sum(s[4]), .diff(d[4]), .cout(c[5]), .bout(b[5]));
full_adder_subtractor fas5(.x(x[5]), .y(y[5]), .bin(b[5]), .cin(c[5]), .sum(s[5]), .diff(d[5]), .cout(c[6]), .bout(b[6]));
full_adder_subtractor fas6(.x(x[6]), .y(y[6]), .bin(b[6]), .cin(c[6]), .sum(s[6]), .diff(d[6]), .cout(c[7]), .bout(b[7]));
full_adder_subtractor fas7(.x(x[7]), .y(y[7]), .bin(b[7]), .cin(c[7]), .sum(s[7]), .diff(d[7]), .cout(c[8]), .bout(b[8]));

assign  bout_n = b[8];

endmodule
