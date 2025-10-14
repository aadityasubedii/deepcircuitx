`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:17:25 01/08/2024 
// Design Name: 
// Module Name:    half_adder_behvaioural 
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
module half_adder_behvaioural(a,b,s,c
    );
input a,b;
output reg s ,c;
always @(*)
   begin
	      s=a^b;
			c=a&b;
	end

endmodule
