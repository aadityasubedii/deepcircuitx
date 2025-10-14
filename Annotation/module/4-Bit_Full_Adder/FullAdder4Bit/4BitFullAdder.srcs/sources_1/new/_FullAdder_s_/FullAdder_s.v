`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2023 02:02:56 PM
// Design Name: 
// Module Name: FullAdder_s
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


module FullAdder_s(sum_out, c_out, n1, n2, c_in);

    output sum_out, c_out; 

    input n1, n2, c_in;
    
    wire sum1, c1, c2; // setting up in/out

    xor(sum1, n1, n2);
    xor(sum_out, sum1, c_in); // sum logic

    and(c1, n1, n2); 
    and(c2, sum1, c_in); 
    or(c_out, c1, c2); //carry logic 
    

//this is single bit full adder
   
endmodule
