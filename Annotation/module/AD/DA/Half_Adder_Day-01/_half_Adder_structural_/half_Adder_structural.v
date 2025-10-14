`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:23 01/08/2024 
// Design Name: 
// Module Name:    half_adder_structural 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module half_Adder_structural(a,b,s,c
    );
output s,c;
input a,b;
xor uut(s,a,b);

    
and uut1(c,a,b);

endmodule
