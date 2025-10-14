`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 17:02:08
// Design Name: 
// Module Name: pe_2
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


module pe_2(input [8:0] q1, q2, output [8:0] o1);

wire [8:0] t_to_s_1, t_to_s_2;
wire ex_or_out;
wire [7:0] CMP_out; // comparator output in fig. 6
wire [8:0] combined_CMP_out;

two_to_sign t_s_i1 (.tcsm_in1(q1), .tcsm_out1(t_to_s_1));
two_to_sign t_s_i2 (.tcsm_in1(q2), .tcsm_out1(t_to_s_2));

assign ex_or_out = t_to_s_1[8] ^ t_to_s_2[8];

comparator_module comp1(.comp_in1(t_to_s_1[7:0]), .comp_in2(t_to_s_2[7:0]), .comp_out1(CMP_out));

assign combined_CMP_out = {ex_or_out, CMP_out};

two_to_sign t_s_o1 (.tcsm_in1(combined_CMP_out), .tcsm_out1(o1));

endmodule
