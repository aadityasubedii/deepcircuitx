`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunavant 
// 
// Create Date: 20.07.2023 07:59:12
// Design Name:Gunavant 
// Module Name: tb_half_adder
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


module tb_half_adder;
    reg a,b;
    wire sum,carry;
    
    half_adder HA(.a(a),.b(b),.carry(carry),.sum(sum));
    
    initial begin
        #5 a = 0; b = 0;
        #5 a = 0; b = 1;
        #5 a = 1; b = 0;
        #5 a = 1; b = 1;
        #5 $stop;
    end 
endmodule
