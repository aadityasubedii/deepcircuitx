`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 08:48:32 PM
// Design Name: 
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
        wire sum, carry;
        
        half_adder A1(.a(a),.b(b),.sum(sum),.carry(carry));
        
            initial begin
            #5 a = 0;
               b = 0;
            
            #5 a = 0;
               b = 1;
               
            #5 a = 1;
               b = 0;    
               
            #5 a = 1;
               b = 1;    
            
            end     
endmodule
