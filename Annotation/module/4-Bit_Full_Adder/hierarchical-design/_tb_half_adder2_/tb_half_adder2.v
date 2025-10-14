`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 12:19:43
// Design Name: 
// Module Name: tb_half_adder2
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


module tb_half_adder2();
    reg s, c_in;
    wire sum, c_out;
    
half_adder2 haa1(.s(s),
                  .c_in(c_in),
                  .sum(sum),
                  .c_out(c_out));

initial
    begin
        s = 0;
        c_in = 0;  
        #10
        s = 1;  
        #10
        s = 1;
        c_in = 0;  
        #10
        c_in = 1;  
        #10
        $finish;
    
    end 
    initial
        begin
        $monitor("Time=%0t s=%0b c_in=%0b sum=%0b c_out=0%0b",$time,s,c_in,sum,c_out);
         
        end                 
                     
endmodule
