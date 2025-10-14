`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:27 05/27/2023 
// Design Name: 
// Module Name:    register_mem 
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








module register_mem(clk, clr, ld, D_in, D_out);
input clk, clr, ld;
input [3:0] D_in;
output reg [3:0] D_out;

always@(posedge clk) begin
if(clr) begin
D_out <= 0;
end
else if (ld) begin
D_out <= D_in;
end
end

endmodule
