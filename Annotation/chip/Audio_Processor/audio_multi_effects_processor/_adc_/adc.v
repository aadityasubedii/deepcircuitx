`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:05 09/01/2022 
// Design Name: 
// Module Name:    adc 
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
module adc(
	input clock,
	input clockenable,
	input miso,
	output adconv,
	output reg [0:11]datos,
	output reg ready, //Može biti korisno imati znak upozorenja
	output sck
);

reg [5:0]bloque;
//Zauzima 1+34 bloka
//1 za poèetni puls
//blok 35=0
reg estadoadconv,estadosck;
reg [0:11]datostemp; // Varijabla koja ne mijenja podatke u svakom trenutku

// Može biti korisno za izbjegavanje pogrešaka
assign adconv=estadoadconv?clock:0;
assign sck=estadosck?clock:0;

initial begin
	estadoadconv<=0;
	estadosck<=0;
	bloque<=0;
	ready<=0;
end

always@(posedge clock) begin 
if(clockenable) begin //Važno je da clock omoguæi
// Zapoèni prije postedge
//Idealno pola clocka prije if(bloque==0) begin
		bloque<=1;
		estadoadconv<=1;
	end
	else if(bloque==34) begin
		bloque<=0;
	end
	else begin
		bloque<=bloque+1;
		estadoadconv<=0;
	end 
end


always@(negedge clock) begin
	if(bloque>=4 & bloque<=15) datostemp[bloque-4]<=miso;
	else if(bloque==16) datos<=datostemp;
	else if(bloque==34) ready<=1;
	else if(bloque==0) begin 
		ready<=0;
		estadosck<=0;
	end
	else if(bloque==1) estadosck<=1;
// Upozorava se u zadnjem bloku
//kako se ne bi prekidao normalan rad adc
//Spreman radi s negedgeom u zadnjem bloku
end

endmodule
