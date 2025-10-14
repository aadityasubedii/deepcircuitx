module top_module
(
	input CLOCK_50,
	input CLOCK_27,


	//////////// LED //////////
	output		  [7:0]		LEDG,
	output		  [17:0]		LEDR,

	//////////// KEY //////////
	input		     [3:0]		KEY,

	//////////// SW //////////
	input		     [17:0]		SW,


	//////////// Audio //////////
	input		          		AUD_ADCDAT,
	input		          		AUD_ADCLRCK,
	input		          		AUD_BCLK,
	output wire	AUD_DACDAT,
	input		          		AUD_DACLRCK,
	output		        		AUD_XCK,

	//////////// I2C for Audio and Tv-Decode //////////
	output		        		I2C_SCLK,
	inout		          		I2C_SDAT
);

parameter audio_data_size = 16;
wire reset = KEY[0];
wire clock = CLOCK_50;
assign LEDR[audio_data_size-1:0] = adc_data;

/******************** CLOCK divider **************************/
reg  	[10:0]	COUNTER_500;
wire  CLOCK_500 = COUNTER_500[9];
wire  CLOCK_2 = COUNTER_500[1];
wire  XCK;

always @(posedge clock or negedge reset)
begin
	if(!reset)
		COUNTER_500 <= 0;
	else
		COUNTER_500 <= COUNTER_500+1;
end

assign AUD_XCK = XCK;
assign XCK = CLOCK_2;
/******************** end CLOCK divider **************************/

wire [23:0]DATA;
wire endI2C, goI2C;

assign AUD_DACDAT = AUD_ADCDAT;

wire [audio_data_size-1:0]adc_data;

ShiftRegister adc_data_bit
(
	//input
	.clock(AUD_BCLK),
	.reset(reset),
	.data_in(AUD_ADCDAT),
	//output reg[15:0]
	.data_out(adc_data)
);

//CLOCK_500 user
//(
//	.CLOCK(CLOCK_50),
//	// .CLOCK_500(),
//	.END(endI2C),
//	.RESET(reset),
//  .volume_key(KEY[1]),
//  .sound_select(SW[2:0]),
//	.GO(goI2C),
//	.DATA(DATA),
//	// .CLOCK_2()
//);
//
//i2c adc_configure
//(
//	.CLOCK(CLOCK_500),
//	.I2C_SCLK(I2C_SCLK),		//I2C CLOCK
//	.I2C_SDAT(I2C_SDAT),		//I2C DATA
//	.I2C_DATA(DATA),		//DATA:[SLAVE_ADDR,SUB_ADDR,DATA]
//	.GO(goI2C),      		//GO transfor
//	.END(endI2C),    	    //END transfor
//	.W_R(),     		//W_R
//	.ACK(),     	    //ACK
//	.RESET(reset),
//	//TEST
//	.SD_COUNTER(),
//	.SDO()
//);

audio_codec_config user
(
	.clock(clock),
	// input CLOCK_500,
	.reset(reset),
	.volume_key(KEY[1]),
	.sound_select(SW[2:0]),
  
	.I2C_SCLK(I2C_SCLK),		//I2C CLOCK
	.I2C_SDAT(I2C_SDAT)		//I2C DATA
  
);

endmodule
