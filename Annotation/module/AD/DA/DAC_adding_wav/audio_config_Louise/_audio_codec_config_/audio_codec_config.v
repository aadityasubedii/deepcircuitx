module audio_codec_config
(
	input   clock,
	// input CLOCK_500,
	input   reset,
  input   volume_key,
	input   [2:0]sound_select,
  
  inout  			 I2C_SDAT,
 		
	output 			 I2C_SCLK
  
);
reg  	[10:0]	COUNTER_500;
wire  CLOCK_500 = COUNTER_500[9];

wire [23:0]DATA;
wire endI2C, goI2C;

always @(posedge clock or negedge reset)
begin
	if(!reset)
		COUNTER_500 <= 0;
	else
		COUNTER_500 <= COUNTER_500+1;
end

reg_config user
(
	.CLOCK(CLOCK_50),
	// .CLOCK_500(),
	.END(endI2C),
	.RESET(reset),
  .volume_key(volume_key),
  .sound_select(sound_select),
	.GO(goI2C),
	.DATA(DATA),
	// .CLOCK_2()
);

i2c adc_configure
(
	.CLOCK(CLOCK_500),
	.I2C_SCLK(I2C_SCLK),		//I2C CLOCK
	.I2C_SDAT(I2C_SDAT),		//I2C DATA
	.I2C_DATA(DATA),		//DATA:[SLAVE_ADDR,SUB_ADDR,DATA]
	.GO(goI2C),      		//GO transfor
	.END(endI2C),    	    //END transfor
	.W_R(),     		//W_R
	.ACK(),     	    //ACK
	.RESET(reset),
	//TEST
	.SD_COUNTER(),
	.SDO()
);

endmodule