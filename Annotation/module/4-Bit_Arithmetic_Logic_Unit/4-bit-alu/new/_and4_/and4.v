`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2022 06:30:43
// Design Name: 
// Module Name: and4
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


module and4(
    input [3:0] a,
    input [3:0] b,
    output [3:0] out
    );
    and and1 (out[0],a[0],b[0]);
    and and2 (out[1],a[1],b[1]);
    and and3 (out[2],a[2],b[2]);
    and and4 (out[3],a[3],b[3]);
    
endmodule
