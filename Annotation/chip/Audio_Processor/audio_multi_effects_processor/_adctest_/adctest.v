`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:35 09/06/2022
// Design Name:   adc
// Module Name:   C:/Users/Student/04_09_ADC_EFFE_DAC_enc/audioeff_za_test_run/adctest.v
// Project Name:  audioeff_za_test_run
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adctest;

	// Inputs
	reg clock;
	reg clockenable;
	reg miso;

	// Outputs
	wire adconv;
	wire [0:11] datos;
	wire ready;
	wire sck;
	wire [5:0] bloque;
	wire [0:11] datostemp;

	// Instantiate the Unit Under Test (UUT)
	adc uut (
		.clock(clock), 
		.clockenable(clockenable), 
		.miso(miso), 
		.adconv(adconv), 
		.datos(datos), 
		.ready(ready), 
		.sck(sck), 
		.bloque(bloque), 
		.datostemp(datostemp)
	);

	initial begin
		clock = 0;
		clockenable = 0;
		miso = 0;
		#100;
		repeat(700) begin
			clock=~clock;
			#50;
		end
	end
	
	initial begin
		clock = 0;
		clockenable = 0;
		miso = 0;
		#50;
		repeat(10) begin
			clockenable=~clockenable;
			#3500;
		end
	end
	
	initial begin
		clock = 0;
		clockenable = 0;
		miso = 0;
		repeat(700) begin
			miso=~miso;
			#100;
		end
end
      
endmodule

