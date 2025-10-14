`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2023 14:37:55
// Design Name: 
// Module Name: merged_pe_2_tb
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


module merged_pe_2_tb();
reg [8:0] merge_in1, merge_in2;
wire [8:0] merge_out1, merge_out2, merge_out3;

merged_pe_2 merged_pe_2_uut(.merge_in1(merge_in1), .merge_in2(merge_in2), .merge_out1(merge_out1), .merge_out2(merge_out2), .merge_out3(merge_out3));

initial begin
merge_in1 = 9'b010001100;
merge_in2 = 9'b101010001;
end

endmodule
