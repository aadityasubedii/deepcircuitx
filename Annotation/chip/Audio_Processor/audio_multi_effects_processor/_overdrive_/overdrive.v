`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:47 08/18/2022 
// Design Name: 
// Module Name:    overdrive 
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
module overdrive(clk, rlrot, DATA_IN, DATA_OUT);
input clk;
input [1:0] rlrot;
input[0:11] DATA_IN;
output reg[0:11] DATA_OUT;

reg[0:11] THRES = 800;

always@(posedge clk)
begin
	if(rlrot == 2'b11) //u desno
		begin
			if(THRES < 1500)begin
				THRES <= THRES + 100;
			end
			
			else if(THRES == 1500)begin
				THRES <= 1500;
			end
		end
	else if(rlrot == 2'b10) //u livo
		begin
			if(THRES > 100)begin
				THRES <= THRES - 100;
			end
			
			else if(THRES == 100)begin
				THRES <= 100;
			end
		end
end

always@(DATA_IN or THRES)
begin
	if(DATA_IN > THRES)
		DATA_OUT <= DATA_OUT;
	else
		DATA_OUT <= DATA_IN;
end

endmodule
