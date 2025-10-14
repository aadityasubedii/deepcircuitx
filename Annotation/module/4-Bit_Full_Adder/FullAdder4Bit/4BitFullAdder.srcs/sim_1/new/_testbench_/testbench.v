`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2023 02:27:41 PM
// Design Name: 
// Module Name: testbench
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


module testbench; 

    reg[3:0] N1, N2; 
    reg C_IN; 

    wire [3:0]SUM; 
    wire C_OUT; 

    fullAdder4Bit_s FA4(SUM, C_OUT, N1, N2, C_IN); 
    //what we are monitoring in the test bench 
    initial begin

        $monitor($time, "N1 = %b, N2 = %b, C_IN = %b, C_OUT = %b, SUM = %b\n", N1, N2, C_IN,C_OUT, SUM); 

    end
    //What is changing in module, varying the inputs after certain delay and watching output 
    initial begin

        N1 = 4'd0; N2 = 4'd0; C_IN = 1'd0; 
        #5 N1 = 4'd3; N2 = 4'd4;         
        #5 N1 = 4'd2; N2 = 4'd5;         
        #5 N1 = 4'd9; N2 = 4'd9; 
        #5 N1 = 4'd10; N2 = 4'd15; 
        #5 N1 = 4'd10; N2 = 4'd5; C_IN = 1'd1;  

    end
    
endmodule
