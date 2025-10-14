`timescale 1 ps / 1 ps

module tb();

reg clock, clock12288, clock2048, reset;
reg [3:0] key;
initial begin
	clock = 0;
	clock12288 = 0;
	clock2048 = 0;
	reset = 0;
	key = 0;
	#20 reset = 1;
	#12000 reset = 0;
	#20 key[0] = 1;
	#1000000 key[0] = 0;
end

always begin
	#10 clock = !clock;
end

always begin
	#40.69 clock12288 = !clock12288;
end

always begin
	#244.140625 clock2048 = !clock2048;
end

SoCKit_i2sound uut(

							///////////AUD/////////////
		.AUD_ADCDAT(),
		.AUD_ADCLRCK(),
		.AUD_BCLK(),
		.AUD_DACDAT(),
		.AUD_DACLRCK(),
		.AUD_I2C_SCLK(),
		.AUD_I2C_SDAT(),
		.AUD_MUTE(),
		.AUD_XCK(),

		.RESET_n(!reset),
		
							/////////KEY/////////
		.KEY(key),

							/////////LED/////////
		.LED(),

							/////////OSC/////////
		.OSC_50_B3B(clock),
		.clock12288(clock12288),
		.clock2048(clock2048)

);

endmodule
