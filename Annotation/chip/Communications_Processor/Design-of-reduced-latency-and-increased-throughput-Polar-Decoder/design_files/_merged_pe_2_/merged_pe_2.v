`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2023 12:17:48
// Design Name: 
// Module Name: merged_pe_2
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


module merged_pe_2(input [8:0] merge_in1, merge_in2, output [8:0] merge_out1, merge_out2, merge_out3);
wire [8:0] t_to_s_merge1, t_to_s_merge2;
wire ex_or_out;
wire [7:0] int_sum, int_diff;
wire b_n;
wire [7:0] merge_cmp_out; // 2nd step in the block diagram
wire [8:0] merge_combined_cmp_out;
wire sign_o_q2, sign_o_q3;
wire [8:0] sum_combined_out, diff_combined_out;


two_to_sign t_s_merge1(.tcsm_in1(merge_in1), .tcsm_out1(t_to_s_merge1));
two_to_sign t_s_merge2(.tcsm_in1(merge_in2), .tcsm_out1(t_to_s_merge2));

assign ex_or_out = t_to_s_merge1[8] ^ t_to_s_merge2[8];

pe_1_modified pe_1_modified_uut(.x(t_to_s_merge1[7:0]), .y(t_to_s_merge2[7:0]), .s(int_sum), .d(int_diff), .bout_n(b_n));

assign merge_cmp_out = b_n ? t_to_s_merge2[7:0] : t_to_s_merge1[7:0];
assign merge_combined_cmp_out = {ex_or_out, merge_cmp_out}; // combined output of pe_2 kind of model

two_to_sign t_s_merge_o1(.tcsm_in1(merge_combined_cmp_out), .tcsm_out1(merge_out1)); // output q1

sign_processing_unit merge_sign_uut(.sign_q1(t_to_s_merge1[8]), .sign_q2(t_to_s_merge2[8]), .borrow(b_n), .sign_o2(sign_o_q2), .sign_o3(sign_o_q3));

assign sum_combined_out = {sign_o_q2, int_sum};
assign diff_combined_out = {sign_o_q3, int_diff};


// need to start
two_to_sign t_s_merge_o2(.tcsm_in1(sum_combined_out), .tcsm_out1(merge_out2));
two_to_sign t_s_merge_o3(.tcsm_in1(diff_combined_out), .tcsm_out1(merge_out3));
endmodule
