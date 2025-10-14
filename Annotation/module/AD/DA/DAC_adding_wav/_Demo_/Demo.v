module DE2_Audio_Example (
	// Inputs
	CLOCK_50,
	CLOCK_27,
	KEY,
	SW,
 
	AUD_ADCDAT,

	// Bidirectionals
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,

	I2C_SDAT,

	PS2_CLK,
	PS2_DAT,
  
	// Outputs
  HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
  
	AUD_XCK,
	AUD_DACDAT,

	I2C_SCLK,

	LEDR,
	LEDG,

  	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input   CLOCK_50;
input   CLOCK_27;
input   [3:0]   KEY;
input   [17:0]  SW;


input   AUD_ADCDAT;

// Bidirectionals
inout   AUD_BCLK;
inout   AUD_ADCLRCK;
inout   AUD_DACLRCK;

inout   I2C_SDAT;

inout				PS2_CLK;
inout				PS2_DAT;
// Outputs
output   [6:0]HEX0;
output   [6:0]HEX1;
output   [6:0]HEX2;
output   [6:0]HEX3;
output   [6:0]HEX4;
output   [6:0]HEX5;
output  AUD_XCK;
output  AUD_DACDAT;

output  I2C_SCLK;
output  [17:0]  LEDR;
output  [7:0]   LEDG;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout		    [31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire  audio_in_available;
wire  [data_size-1:0]	left_channel_audio_in;
wire  [data_size-1:0]	right_channel_audio_in;
wire  read_audio_in;

wire  audio_out_allowed;
wire  [data_size-1:0]	left_channel_audio_out;
wire  [data_size-1:0]	right_channel_audio_out;
wire  write_audio_out;

wire go; //keyboard

// Internal Registers

reg [18:0] delay_cnt, delay;
reg snd;

assign LEDR = SW;
//assign LEDR = left_channel_audio_in;
// State Machine Registers
parameter data_size = 16;
/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge CLOCK_50)
	if(delay_cnt == delay) begin
		delay_cnt <= 0;
		snd <= !snd;
	end else delay_cnt <= delay_cnt + 1;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign delay = {SW[3:0], 15'd300};

// wire [data_size-1:0] sound = go? total_sound: 0;
wire [data_size-1:0] sound = (SW[3:0] == 0) ? 0 : snd ? 16'h0FF0 : - 16'h0FF0;


assign read_audio_in			= audio_in_available & audio_out_allowed;

assign left_channel_audio_out	  = left_channel_audio_in + sound + total_sound;
assign right_channel_audio_out	= right_channel_audio_in + sound + total_sound;
assign write_audio_out			    = audio_in_available & audio_out_allowed;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

Audio_Controller Audio_Controller_user (
	// Inputs
	.CLOCK_50						(CLOCK_50),
	.reset						(~KEY[0]),

	.clear_audio_in_memory		(),
	.read_audio_in				(read_audio_in),

	.clear_audio_out_memory		(),
	.left_channel_audio_out		(left_channel_audio_out),
	.right_channel_audio_out	(right_channel_audio_out),
	.write_audio_out		(write_audio_out),
	.AUD_ADCDAT					(AUD_ADCDAT),

	// Bidirectionals
	.AUD_BCLK					(AUD_BCLK),
	.AUD_ADCLRCK				(AUD_ADCLRCK),
	.AUD_DACLRCK				(AUD_DACLRCK),

	// Outputs
	.audio_in_available			(audio_in_available),
	.left_channel_audio_in		(left_channel_audio_in),
	.right_channel_audio_in		(right_channel_audio_in),
	.audio_out_allowed			(audio_out_allowed),
	.AUD_XCK					(AUD_XCK),
	.AUD_DACDAT					(AUD_DACDAT)
);

avconf avc (
	.I2C_SCLK					(I2C_SCLK),
	.I2C_SDAT					(I2C_SDAT),
	.sound_select      (SW[4]),
  .sampling_rate_select(SW[5]),
	.CLOCK_50					(CLOCK_50),
	.reset						(~KEY[0])
);

PS2_Demo keyboard
(
	// Inputs
	.CLOCK_50(CLOCK_50),
	.reset(~KEY[0]),
	// SW,

	// Bidirectionals
	.PS2_CLK(PS2_CLK),
	.PS2_DAT(PS2_DAT),

	// Outputs
  .go(go),
  .code1(code1),
  .code2(code2),
  .code3(code3),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.HEX4(HEX4),
	.HEX5(HEX5),
	.LEDG(HEX6),
	.LEDR()
);

reg [15:0] sound1;
reg [15:0] sound2;
reg [15:0] sound3;
wire [15:0] total_sound;

assign total_sound = (sound1 + sound2 + sound3)/3;

sound_wave sound_wave1 (
  .clock(CLOCK_50),
	.alphabet(code1),
  .go(go),

	.sound(sound1)
);

sound_wave sound_wave2 (
  .clock(CLOCK_50),
	.alphabet(code2),
  .go(go),

	.sound(sound2)
);

sound_wave sound_wave3 (
  .clock(CLOCK_50),
	.alphabet(code3),
  .go(go),

	.sound(sound3)
);

reg [15:0] c_wave_data;

C_wave c_sound
(
  .dac_lrclk(AUD_DACLRCK),
  .wave(c_wave_data)
);
endmodule

