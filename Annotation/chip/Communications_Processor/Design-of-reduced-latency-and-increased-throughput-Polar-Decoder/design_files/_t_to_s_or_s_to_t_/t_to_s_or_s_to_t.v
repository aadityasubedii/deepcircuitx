`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 17:52:03
// Design Name: 
// Module Name: two_to_sign
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


module two_to_sign(input [8:0] tcsm_in1, output [8:0] tcsm_out1);
assign tcsm_out1 = (~tcsm_in1) + 1;
endmodule
