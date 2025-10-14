`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:29 09/04/2022 
// Design Name: 
// Module Name:    effect_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module effect_controller(clk, in_DIS, in_DELAY, in_ECHO, in_REVERB, in_CLEAN, switch_DIS, switch_DELAY, switch_ECHO, switch_REVERB, effect_out);

input clk, switch_DIS, switch_DELAY, switch_ECHO, switch_REVERB;
input [0:11] in_DIS, in_DELAY, in_CLEAN, in_ECHO, in_REVERB;
output reg [0:11] effect_out;

always@(posedge clk)
begin
	if(switch_DIS)
		effect_out <= in_DIS;
	else if(switch_DELAY)
		effect_out <= in_DELAY;
	else if(switch_DELAY && switch_DIS)
		effect_out <= in_DIS + in_DELAY;
	else if(switch_ECHO)
		effect_out <= in_ECHO;
	else if(switch_REVERB)
		effect_out <= in_REVERB;
	else
		effect_out <= in_CLEAN;
end

endmodule
