`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunavant
// 
// Create Date: 20.07.2023 07:42:31
// Design Name: 
// Module Name: half_adder
// Project Name: half_adder
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


module half_adder(input a,input b, output sum, output carry );
    assign sum = a ^ b;
    assign carry = a & b;
endmodule
