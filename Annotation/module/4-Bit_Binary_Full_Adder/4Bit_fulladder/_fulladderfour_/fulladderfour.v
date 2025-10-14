`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 22:42:50
// Design Name: 
// Module Name: fulladderfour
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


module fulladderfour(
input  a,
input  b,
input cin,
output  sum,
output  carry
    );
    assign sum = a^b^cin;
    assign carry = (a&b)|(b&cin)|(a&cin);
endmodule
