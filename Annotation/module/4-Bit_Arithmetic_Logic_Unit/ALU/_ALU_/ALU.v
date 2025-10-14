`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2016 09:34:36 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] A,
    input [3:0] B,
    input [1:0] Sel,
    output [3:0] Y
    );
    
    reg[3:0] H;
    assign Y = H;
    always @(A or B or Sel)

        begin
		
			case(Sel)
			2'b00: H = A + B;
			2'b01: H = A - B;
			2'b10: H = A | B;
			2'b11: H = A & B;
			endcase
			

        
        end    
    
endmodule
