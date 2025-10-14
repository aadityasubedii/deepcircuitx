`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 16:29:22
// Design Name: 
// Module Name: half_adder_subtractor
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


module half_adder_subtractor(input x, y, output sum, diff, output cout, bout);
assign sum = x ^ y;
assign cout = x & y;
assign diff = x ^ y;
assign bout = (~x) & y;
endmodule
