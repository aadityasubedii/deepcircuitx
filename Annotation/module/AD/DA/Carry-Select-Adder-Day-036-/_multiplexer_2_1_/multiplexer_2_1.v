`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 10:05:23 PM
// Design Name: 
// Module Name: multiplexer_2_1
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


module multiplexer_2_1(X, A0, A1, s);
   parameter WIDTH=16;     // How many bits wide are the lines

   output [WIDTH-1:0] X;   // The output line

   input [WIDTH-1:0]  A1;  // Input line with id 1'b1
   input [WIDTH-1:0]  A0;  // Input line with id 1'b0
   input 	      s;  // Selection bit
   
   assign X = (s == 1'b0) ? A0 : A1;
endmodule