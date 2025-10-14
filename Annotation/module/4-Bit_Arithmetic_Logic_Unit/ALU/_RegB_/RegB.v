`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2016 09:41:38 AM
// Design Name: 
// Module Name: RegB
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


module RegB(
    input [3:0] sw,
    input btnC,
    input btnL,
    output [3:0] B
    );
    
    reg [3:0] W;
    
    assign B = W;
always @(btnC or btnL)
    begin
		if(btnC == 1)
		begin
		W = 4'b0000;
		end
		else if(btnC == 0 && btnL == 1)
		begin
		W = sw;
		end
		if(btnC == 0 && btnL == 0)
		begin	
		W = W;	
		end
	end 
endmodule
