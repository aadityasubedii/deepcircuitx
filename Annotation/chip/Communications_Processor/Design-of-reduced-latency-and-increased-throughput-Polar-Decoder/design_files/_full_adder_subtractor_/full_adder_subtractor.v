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


module full_adder_subtractor(input x, y , input bin, cin, output sum, diff, output cout, bout);

assign sum = x ^ y ^ cin;
assign diff = x ^ y ^ bin;
assign cout = (x & y) | ((x ^ y) & cin);
assign bout = ((~x) & y) | ((~(x ^ y)) & bin);

endmodule
