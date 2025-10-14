`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2023 10:14:22
// Design Name: 
// Module Name: comparator_module
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


module comparator_module(input [7:0] comp_in1, comp_in2, output reg [7:0] comp_out1);

always @ (*) begin //reset condition required or not : think of it later
if (comp_in1 < comp_in2) comp_out1 = comp_in1;
else comp_out1 = comp_in2;
end
endmodule
