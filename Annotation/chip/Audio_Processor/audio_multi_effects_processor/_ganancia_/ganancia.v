`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:08 09/01/2022 
// Design Name: 
// Module Name:    ganancia 
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
module ganancia(
	input clock,
	input clockenable,

	output reg mosi,
	output sck,
	output reg ampcs,
	output reg ampshdn
);

reg [3:0]bloque;
//Dobitak zauzima 1+8+1 blok (od 1 do ...7,8,9,0)
//Dodatni blok za sinkronizaciju i postavljanje AMPCS na 1
reg [0:7]gain=8'b0100_0100;
//Pojaèanje od -2 uobièajeno za audio aplikacije
//Minimalno 1025[V] i najviše 2275[V]

reg estadosck;
//Koristiti spiSCK samo kada je potrebno
assign sck=estadosck?clock:0;

initial begin
	bloque<=0;
	ampcs<=1;
	ampshdn<=0;
	estadosck<=0;
	mosi<=0;
end

always@(posedge clock) begin
if(clockenable) begin
	if(bloque==0) begin
		bloque<=1;
		ampcs<=0;
	end
	else if (bloque==9) begin
		bloque<=0;
		estadosck<=0;
		ampcs<=1;
	end
	else begin
		bloque<=bloque+1;
		estadosck<=1;
	end
end
end

always@(negedge clock) begin
	if(bloque!=0 & bloque!=9) begin
		mosi<=gain[bloque-1];
	end
	else mosi<=0;
end

endmodule
