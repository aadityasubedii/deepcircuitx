`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 12:24:47
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder();
    reg a_in,b_in, c_in;
    wire sum, carry;
    
full_adder haa1(.a_in(a_in),
                  .c_in(c_in),
                  .b_in(b_in),
                  .sum(sum),
                  .carry(carry));

initial
    begin
        a_in = 0;
        b_in = 0;
        c_in=0;  
        #10
        a_in = 1;  
        #10
        b_in = 1;
        c_in = 1;  
        #10
        a_in=1; 
        b_in=0; 
        c_in = 0;  
        #10
        $finish;
    
    end 
    initial
        begin
        $monitor("Time=%0t a_in=%0b b_in=%0b c_in=%0b sum=%0b carry=0%0b",$time,a_in,b_in,c_in,sum,carry);
         
        end                 
                     
endmodule
