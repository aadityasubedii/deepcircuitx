`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 10:06:17 PM
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder(a, b, s, c);
   input [7:0]a;   
   input [7:0]b;   
   output [7:0]s;   
   output c;   
   
   wire [3:0]s0; 
   wire [3:0]s1; 
   wire 	c0; 
   wire 	c1; 
   wire 	clow;
    
   ripple_carry_adder r4(a[3:0], b[3:0], s[3:0], clow);
   ripple_carry_adder r5(a[7:4], b[7:4], s0, c0);    
   ripple_carry_adder r6(a[7:4], b[7:4], s1, c1);      
   multiplexer_2_1 #(4) muxs(s[7:4], s0, s1, clow);
   multiplexer_2_1 #(1) muxc(c, c0, c1, clow);      
endmodule
