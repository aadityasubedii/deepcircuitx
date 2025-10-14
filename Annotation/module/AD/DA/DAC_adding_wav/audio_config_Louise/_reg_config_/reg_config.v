// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altrea Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL or Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions: I2C output data
//
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author             :| Mod. Date :| Changes Made:
//   V1.0 :| Allen Wang         :| 03/24/10  :| Initial Revision
// ============================================================================
`define rom_size 6'd10

module reg_config
(
	input   CLOCK,
	// input CLOCK_500,
	input   END,
	input   RESET,
  input   volume_key,
	input   [2:0]sound_select,
	output wire GO,
	output wire [23:0]DATA
	// CLOCK_2
);

//=======================================================
//  PORT declarations
//=======================================================                


	reg  	[10:0]	COUNTER_500;
	reg  	[15:0]	ROM[`rom_size:0];
	reg  	[15:0]	DATA_A;
	reg  	[5:0]	address;
//
//wire  CLOCK_500=COUNTER_500[9];
//wire  CLOCK_2=COUNTER_500[1];
assign DATA={8'h34,DATA_A};	
assign  GO =((address <= `rom_size) && (END==1))? COUNTER_500[10]:1;
//=============================================================================
// Structural coding
//=============================================================================

always @(negedge RESET or posedge END) 
	begin
		if (!RESET)
			begin
				address=0;
			end
		else if (address <= `rom_size)
				begin
					address=address+1;
				end
	end

reg [4:0] vol;
wire [6:0] volume;
always @(posedge volume_key) 
	begin
		vol=vol-1;
	end
assign volume = vol+96;

reg [2:0] sound_selector;
always @(posedge RESET)
begin
	sound_selector <= sound_select;
end

parameter AUD_LINE_IN_LC	= 9'h18;	//9'b000011000;	//de-mute
parameter AUD_LINE_IN_RC	= 9'h18;	//9'b000011000;	//de-mute
parameter AUD_LINE_OUT_LC	= 9'h77;	//9'b001110111;	//normal line out
parameter AUD_LINE_OUT_RC	= 9'h77;	//9'b001110111;	//normal line out
//reg [8:0]AUD_ADC_PATH		= 9'h11;	//9'b000010001;	//only DAC to line out,mute mic
parameter AUD_DAC_PATH		= 9'h06;	//9'b000000110;	//de-emp 48kHz
//parameter AUD_DAC_PATH		= 9'h02;	//9'b000000010;	//de-emp 32kHz
parameter AUD_POWER			= 9'h00;	//9'b000000000;	//On all
parameter AUD_DATA_FORMAT	= 9'h41;	//9'b001000001;	//master, 16bit, MSB-left
parameter AUD_SAMPLE_CTRL	= 9'h00;	//9'b000000000;
//parameter AUD_SAMPLE_CTRL	= 9'h04;	//9'b000000100;
parameter AUD_SET_ACTIVE	= 9'h01;	//9'b000000001;

always @(posedge END) 
	begin
		ROM[0] = {7'h6, AUD_POWER};;	    			 //power down
		ROM[1] = 16'h1200;
		ROM[2] = {7'h7, AUD_DATA_FORMAT};	   		    	//master, invert Bclk,16bit, I2Sformat, MSB-F left 1 justified
		// ROM[3] = {8'h08, 2'b00, sound_selector[2:0], 3'b010};
		ROM[3] = {7'h4, AUD_ADC_PATH};
	
		ROM[4] = {7'h8, AUD_SAMPLE_CTRL};					 //sampling ctrl, 48kHz, 48Khz,
		ROM[5] = {7'h0, AUD_LINE_IN_LC};					 ////left line in
		ROM[6] = {7'h1, AUD_LINE_IN_RC};					 //right line in
		ROM[7] = {8'h04,1'b0,volume[6:0]};		 //
		ROM[8] = {8'h06,1'b0,volume[6:0]};	     //sound vol
	
		ROM[9] = {7'h5, AUD_DAC_PATH}; //digital audio path ctrl, default value
		ROM[`rom_size]= {7'h9, AUD_SET_ACTIVE};            //active
		DATA_A=ROM[address];
	end

always @(posedge CLOCK ) 
	begin
		COUNTER_500=COUNTER_500+1;
	end

endmodule
