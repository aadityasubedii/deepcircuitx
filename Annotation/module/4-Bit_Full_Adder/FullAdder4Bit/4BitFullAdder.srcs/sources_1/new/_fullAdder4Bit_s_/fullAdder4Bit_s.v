`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2023 02:01:25 PM
// Design Name: 
// Module Name: fullAdder4Bit_s
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


module fullAdder4Bit_s(sum_out, c_out, n1, n2, c_in);

    output [3:0]sum_out; // sum out as a 4 bit vector
    output c_out; 

    input [3:0]n1, n2; // n1 n2 inputs 4 bit in length 
    input c_in;  

    wire c1, c2, c3; // intermediate carry bits 

    //four instances of full adders connected via carry wires 

    FullAdder_s FA0(sum_out[0], c1, n1[0], n2[0], c_in); 
    FullAdder_s FA1(sum_out[1], c2, n1[1], n2[1], c1);
    FullAdder_s FA2(sum_out[2], c3, n1[2], n2[2], c2);
    FullAdder_s FA3(sum_out[3], c_out, n1[3], n2[3], c3);

//this is a four bit adder implemented by adding 4 full adders together 

endmodule

