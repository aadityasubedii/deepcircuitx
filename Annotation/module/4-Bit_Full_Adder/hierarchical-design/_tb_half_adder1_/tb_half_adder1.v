`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2024 16:10:52
// Design Name: 
// Module Name: tb_half_adder1
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


module tb_half_adder1();
    reg a_in, b_in;
    wire s, c;
    
half_adder1 haa1(.a_in(a_in),
                  .b_in(b_in),
                  .s(s),
                  .c(c));

initial
    begin
        a_in = 0;
        b_in = 0;  
        #10
        a_in = 1;  
        #10
        a_in = 1;
        b_in = 0;  
        #10
        b_in = 1;  
        #10
        $finish;
    
    end 
    initial
        begin
        $monitor("Time=%0t a_in=%0b b_in=%0b s=%0b c=0%0b",$time,a_in,b_in,s,c);
         
        end                 
                     
endmodule
