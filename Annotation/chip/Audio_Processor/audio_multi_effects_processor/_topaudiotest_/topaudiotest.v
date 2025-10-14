`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:43:12 09/06/2022
// Design Name:   topaudio
// Module Name:   C:/Users/Student/04_09_ADC_EFFE_DAC_enc/audioeff_za_test_run/topaudiotest.v
// Project Name:  audioeff_za_test_run
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: topaudio
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module topaudiotest;

	// Inputs
	reg clock;
	reg miso;

	// Outputs
	wire adconv;
	wire ready;
	wire sck;
	wire mosi;
	wire daccs;
	wire dacclr;
	wire spissb;
	wire sf_ce0;
	wire fpgainitb;
	wire ampcs;
	wire ampshdn;
	wire Egain;
	wire Eadc;
	wire Edac;
	wire [0:11] datosINTERNO;

	// Instantiate the Unit Under Test (UUT)
	topaudio uut (
		.clock(clock), 
		.miso(miso), 
		.adconv(adconv), 
		.ready(ready), 
		.sck(sck), 
		.mosi(mosi), 
		.daccs(daccs), 
		.dacclr(dacclr), 
		.spissb(spissb), 
		.sf_ce0(sf_ce0), 
		.fpgainitb(fpgainitb), 
		.ampcs(ampcs), 
		.ampshdn(ampshdn), 
		.Egain(Egain), 
		.Eadc(Eadc), 
		.Edac(Edac), 
		.datosINTERNO(datosINTERNO)
	);

	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(2500*10*3) begin
			clock=~clock;
			#50;
		end
	end
	
	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(1250*10*2) begin
			miso=~miso;
			#1000;
		end
end
      
endmodule

