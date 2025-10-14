`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:17:44 09/06/2022
// Design Name:   ganancia
// Module Name:   C:/Users/Student/04_09_ADC_EFFE_DAC_enc/audioeff_za_test_run/gananciatest.v
// Project Name:  audioeff_za_test_run
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ganancia
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gananciatest;

	// Inputs
	reg clock;
	reg clockenable;

	// Outputs
	wire mosi;
	wire sck;
	wire ampcs;
	wire ampshdn;
	wire [3:0] bloque;

	// Instantiate the Unit Under Test (UUT)
	ganancia uut (
		.clock(clock), 
		.clockenable(clockenable), 
		.mosi(mosi), 
		.sck(sck), 
		.ampcs(ampcs), 
		.ampshdn(ampshdn), 
		.bloque(bloque)
	);

initial begin
		clock = 0;
		clockenable = 0;
		#100;
		repeat(200) begin
		clock=~clock;
		#50;
		end
	end
	initial begin
		clock = 0;
		clockenable = 0;
		#50;
		repeat(10) begin
		clockenable=~clockenable;
		#1000;
		end
end
      
endmodule

