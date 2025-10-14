`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2023 10:32:23
// Design Name: 
// Module Name: pe_2_tb
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


module pe_2_tb();
reg [8:0] q1, q2;
wire [8:0] o1;

pe_2 pe_2_1(.q1(q1), .q2(q2), .o1(o1));

initial begin
q1 = 9'b010001100;
q2 = 9'b101010001; // checked for one case it is working fine, later can check if needed.
end
endmodule
