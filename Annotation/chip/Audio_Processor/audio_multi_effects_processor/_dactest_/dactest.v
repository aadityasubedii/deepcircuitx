`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:06:12 09/06/2022
// Design Name:   dac
// Module Name:   C:/Users/Student/04_09_ADC_EFFE_DAC_enc/audioeff_za_test_run/dactest.v
// Project Name:  audioeff_za_test_run
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dac
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dactest;

	// Inputs
	reg clock;
	reg clockenable;
	reg [0:11] datos;

	// Outputs
	wire mosi;
	wire daccs;
	wire sck;
	wire dacclr;
	wire [5:0] bloque;

	// Instantiate the Unit Under Test (UUT)
	dac uut (
		.clock(clock), 
		.clockenable(clockenable), 
		.datos(datos), 
		.mosi(mosi), 
		.daccs(daccs), 
		.sck(sck), 
		.dacclr(dacclr), 
		.bloque(bloque)
	);

	initial begin
		clock = 0;
		clockenable = 0;
		datos = 2357;
		#100;
		repeat(340) begin
			clock=~clock;
			#50;
		end
	end

	initial begin
		clock = 0;
		clockenable = 0;
		datos = 2357;
		#50;
		repeat(5) begin
			clockenable=~clockenable;
			#3400;
		end
end
      
endmodule

