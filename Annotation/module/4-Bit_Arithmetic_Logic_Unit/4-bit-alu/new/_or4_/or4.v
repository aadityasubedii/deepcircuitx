`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2022 06:43:28
// Design Name: 
// Module Name: or4
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


module or4(
    input [3:0] a,
    input [3:0] b,
    output [3:0] out
    );
    or or0 (out[0],a[0],b[0]);
    or or1 (out[1],a[1],b[1]);
    or or2 (out[2],a[2],b[2]);
    or or3 (out[3],a[3],b[3]);
    
endmodule
