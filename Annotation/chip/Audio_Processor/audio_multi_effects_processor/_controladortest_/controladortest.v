`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:45:19 09/06/2022
// Design Name:   controlador
// Module Name:   C:/Users/Student/04_09_ADC_EFFE_DAC_enc/audioeff_za_test_run/controladortest.v
// Project Name:  audioeff_za_test_run
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controladortest;

	// Inputs
	reg clock;

	// Outputs
	wire enablegain;
	wire enableadc;
	wire enabledac;
	wire spissb;
	wire sf_ce0;
	wire fpgainitb;
	wire [6:0] contador;

	// Instantiate the Unit Under Test (UUT)
	controlador uut (
		.clock(clock), 
		.enablegain(enablegain), 
		.enableadc(enableadc), 
		.enabledac(enabledac), 
		.spissb(spissb), 
		.sf_ce0(sf_ce0), 
		.fpgainitb(fpgainitb), 
		.contador(contador)
	);

	initial begin
		clock = 0;
		#100;
		repeat(300) begin
			clock=~clock;
			#50;
		end
end
      
endmodule

