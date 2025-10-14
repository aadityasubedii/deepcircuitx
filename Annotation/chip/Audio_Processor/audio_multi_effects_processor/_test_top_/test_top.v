`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:47:46 09/11/2022
// Design Name:   topaudio
// Module Name:   C:/Users/BLOBFISH/Z_G_S_1_09_AUDIO_EFF/Z_G_S_1_09_AUDIO_EFF/test_top.v
// Project Name:  Z_G_S_1_09_AUDIO_EFF
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

module test_top;

	// Inputs
	reg clock;
	reg rot_a;
	reg rot_b;
	reg swDIS;
	reg swDEL;
	reg swECHO;
	reg swREVERB;
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
	wire [0:11] effect_OUT;
	wire [0:11] datosINTERNO;

	// Instantiate the Unit Under Test (UUT)
	topaudio uut (
		.clock(clock), 
		.rot_a(rot_a), 
		.rot_b(rot_b), 
		.swDIS(swDIS), 
		.swDEL(swDEL), 
		.swECHO(swECHO), 
		.swREVERB(swREVERB), 
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
		.effect_OUT(effect_OUT),
		.datosINTERNO(datosINTERNO)
	);

	initial begin
		swDIS = 0;
		swDEL = 0;
		swECHO = 0;
		swREVERB = 0;
		#20000
		swDIS = 1;
		#40000
		swDIS = 0;
		swDEL = 1;
		#40000
		swDEL = 0;
		swECHO = 1;
		#40000
		swECHO = 0;
		swREVERB = 1;
		#40000
		swREVERB = 0;
	end

	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(2500*10**3) begin
			clock=~clock;
			#50;
		end
	end
	
	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(1250*10**2) begin
			miso=~miso;
			#1000;
		end
	end
      
endmodule

