`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 17:56:23
// Design Name: 
// Module Name: t_to_s_tb
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


module t_to_s_tb();
reg [8:0] in1;
wire [8:0] out1;

two_to_sign uut (.in1(in1), .out1(out1));

initial begin
in1 = 9'b001101010;
#20 in1 = 9'b111100111;
end

endmodule
