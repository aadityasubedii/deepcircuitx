`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:09 08/20/2022 
// Design Name: 
// Module Name:    Delay_IIR 
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
module Delay(clk, rlrot, DATA_IN, DATA_OUT);

input clk;
input [1:0] rlrot;
input[0:11] DATA_IN;
output reg	[0:11] DATA_OUT;

reg [0:11] DELAY[25:0];

integer i = 5;

initial begin

DATA_OUT = 11'b000000000000;
DELAY[0] = 11'b000000000000;
DELAY[1] = 11'b000000000000;
DELAY[2] = 11'b000000000000;
DELAY[3] = 11'b000000000000;
DELAY[4] = 11'b000000000000;
DELAY[5] = 11'b000000000000;
DELAY[6] = 11'b000000000000;
DELAY[7] = 11'b000000000000;
DELAY[8] = 11'b000000000000;
DELAY[9] = 11'b000000000000;
DELAY[10] = 11'b000000000000;
DELAY[11] = 11'b000000000000;
DELAY[12] = 11'b000000000000;
DELAY[13] = 11'b000000000000;
DELAY[14] = 11'b000000000000;
DELAY[15] = 11'b000000000000;
DELAY[16] = 11'b000000000000;
DELAY[17] = 11'b000000000000;
DELAY[18] = 11'b000000000000;
DELAY[19] = 11'b000000000000;
DELAY[20] = 11'b000000000000;
DELAY[21] = 11'b000000000000;
DELAY[22] = 11'b000000000000;
DELAY[23] = 11'b000000000000;
DELAY[24] = 11'b000000000000;
DELAY[25] = 11'b000000000000;

end

always@(posedge clk)
begin
	if(rlrot == 2'b11) //u desno
		begin
			if(i < 25)begin
				i <= i + 1;
			end
			
			else if(i == 25)begin
				i <= 25;
			end
		end
	if(rlrot == 2'b10) //u livo
		begin
			if(i > 0)begin
				i <= i - 1;
			end
			
			else if(i == 0)begin
				i <= 0;
			end
		end
end

always@(DATA_IN or i)
begin
	DATA_OUT = DATA_IN  + DELAY[i];
end

always@(posedge clk)
begin
		DELAY[0] <= DATA_IN;
		DELAY[1] <= DELAY[0];
		DELAY[2] <= DELAY[1];
		DELAY[3] <= DELAY[2];
		DELAY[4] <= DELAY[3];
		DELAY[5] <= DELAY[4];
		DELAY[6] <= DELAY[5];
		DELAY[7] <= DELAY[6];
		DELAY[8] <= DELAY[7];
		DELAY[9] <= DELAY[8];
		DELAY[10] <= DELAY[9];
		DELAY[11] <= DELAY[10];
		DELAY[12] <= DELAY[11];
		DELAY[13] <= DELAY[12];
		DELAY[14] <= DELAY[13];
		DELAY[15] <= DELAY[14];
		DELAY[16] <= DELAY[15];
		DELAY[17] <= DELAY[16];
		DELAY[18] <= DELAY[17];
		DELAY[19] <= DELAY[18];
		DELAY[20] <= DELAY[19];
		DELAY[21] <= DELAY[20];
		DELAY[22] <= DELAY[21];
		DELAY[23] <= DELAY[22];
		DELAY[24] <= DELAY[23];
		DELAY[25] <= DELAY[24];
end

endmodule
