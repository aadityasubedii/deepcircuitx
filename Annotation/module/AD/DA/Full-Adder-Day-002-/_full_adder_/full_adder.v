`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 11:11:42 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(a,b,cin,sum,cout);

            input a,b,cin;
            output sum,cout;
            
            assign sum = a ^ b ^ cin;
            assign cout = ((a & b) | (b & cin) | (a & cin));
            
endmodule
