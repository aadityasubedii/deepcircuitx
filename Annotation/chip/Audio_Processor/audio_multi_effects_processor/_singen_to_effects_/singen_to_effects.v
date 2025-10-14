`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2022 13:03:49
// Design Name: 
// Module Name: singen_to_effects
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


module singen_to_effects(clk, data_out_sin, data_out_OD, data_out_DELAY, data_out_REVERB, data_out_ECHO);

input clk;
output [11:0] data_out_sin, data_out_OD, data_out_DELAY, data_out_REVERB, data_out_ECHO;

wire [11:0] sin_to_eff;

assign data_out_sin = sin_to_eff;

sine_wave_gen singen (.clk(clk), .data_out(sin_to_eff));
overdrive OD (.clk(clk), .DATA_IN(sin_to_eff), .DATA_OUT(data_out_OD));
Delay DEL (.clk(clk), .DATA_IN(sin_to_eff), .DATA_OUT(data_out_DELAY));

REVERB rev (.clk(clk), .DATA_IN(sin_to_eff), .DATA_OUT(data_out_REVERB));
ECHO ech (.clk(clk), .DATA_IN(sin_to_eff), .DATA_OUT(data_out_ECHO));
 
endmodule
