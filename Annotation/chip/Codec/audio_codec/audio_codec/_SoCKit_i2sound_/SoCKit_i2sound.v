module SoCKit_i2sound(

							///////////AUD/////////////
		input	 wire				AUD_ADCDAT, //ADC input, no need to drive
		inout	 wire				AUD_ADCLRCK,//ADC input, no need to drive
		inout	 wire				AUD_BCLK,//min. 256 khz, driven
		output wire				AUD_DACDAT, //DAC output, driven
		inout	 wire				AUD_DACLRCK,//DAC clock, driven, sample rate = 8 khz
		output wire				AUD_I2C_SCLK,//I2C clock, driven
		inout	 wire				AUD_I2C_SDAT,//I2C data, driven
		output wire				AUD_MUTE,//mute audio, driven
		output wire				AUD_XCK,//MCLK, driven from pll, 12.288 mhz
		input  wire				RESET_n,
		
							/////////KEY/////////
		input	 wire  [3:0]		KEY,

							/////////LED/////////
		output wire	[3:0]			LED,

							/////////OSC/////////
		input	 wire				OSC_50_B3B, //50 mhz clock
		input  wire 			clock12288,
		input  wire    		clock2048

);

wire CLK_2048;
wire RST, pll_locked, dai_reset;
wire [3:0] status;
reg dai_reset_delay;

assign AUD_MUTE = KEY[3];
assign dai_reset = (status == 4'hA)?1'b0:1'b1;
//assign RST = ~pll_locked; //hardware

//I2C output data
i2c_av_config av_config (
    .clk (OSC_50_B3B),
    .reset (!RESET_n), //simulation
	 	//.reset(RST),
    .i2c_sclk (AUD_I2C_SCLK),
    .i2c_sdat (AUD_I2C_SDAT),
    .status (status)
);
wire [17:0] rom_address;
wire clk_rom;
wire [15:0] rom_data;
dai dai_inst(
	.mclk(clock12288),    //simulation
	.clk_2048(clock2048), //simulation
	//.mclk(AUD_XCK),
	//.clk_2048(CLK_2048),
	.bclk(AUD_BCLK),
	.lrclk(AUD_DACLRCK),

	.reset(dai_reset), 
	
	.clk_rom(clk_rom),
	.rom_address(rom_address),
	.rom_data(rom_data),
	
	.output_to_dac(AUD_DACDAT)
);
					 
audio_rom audio_rom_inst(
	.address(rom_address),
	.clock(clk_rom),
	.q(rom_data)
);

/*pll2  pll_inst(
		.refclk(OSC_50_B3B),   //  refclk.clk
		.rst(1'b0),      //   reset.reset
		.outclk_0(AUD_XCK), // mclk
		.outclk_1(CLK_2048),  // 2.048 mhz. Divide by 8 to get bclk, divide by 64 to get sample rate
		.locked(pll_locked)
	);*/
endmodule
