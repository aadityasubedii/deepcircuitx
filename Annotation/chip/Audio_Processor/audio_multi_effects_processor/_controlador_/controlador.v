`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:36 09/01/2022 
// Design Name: 
// Module Name:    controlador 
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
module controlador(
	input clock,
	output reg enablegain,
	output reg enableadc,
	output reg enabledac,
	//Za ispravan rad ADC i DAC
   //Morate onemoguæiti neke SPI module
	output reg spissb,
	output reg sf_ce0, 	
	output reg fpgainitb
);

reg [6:0]contador; //brojaè
initial begin
	contador<=0;
	enablegain<=0;
	enableadc<=0;
	enabledac<=0;
	
	spissb<=1;
	sf_ce0<=1;
	fpgainitb<=0;
end
//10 blokova za dobitak
//35 za adc
//34 za dac
//Brojaè od 1 do "79"
//79=10 za brojaè jer se nikada ne vraæa na "0" (dobi samo jednom)
//Vratite se na ADC
always@(negedge clock) begin
	if(contador<10) begin
		contador<=contador+1;
		enablegain<=1;
	end
	else if(contador<45) begin
		contador<=contador+1;
		enablegain<=0;
		enableadc<=1;
		enabledac<=0;
	end
	else if(contador<78) begin
		contador<=contador+1;
		enableadc<=0;
		enabledac<=1;
	end
	else if(contador==78) contador<=10;
	//Nije elegantno ovdje staviti elsif
	//S else simulacije su bile pogrešne
end

endmodule