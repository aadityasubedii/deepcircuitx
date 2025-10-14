`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2023 13:11:49
// Design Name: 
// Module Name: sign_processing_unit
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


module sign_processing_unit(input sign_q1, sign_q2, borrow, output sign_o2, sign_o3);
wire i1, i2, i3;

assign i1 = (~borrow) & sign_q1;
assign i2 = borrow & sign_q2;
assign i3 = (~borrow) & sign_q2;

assign sign_o2 = i1 | i3;
assign sign_o3 = i1 | i2;

endmodule
