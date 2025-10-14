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

always @(posedge END) 
	begin
	//	ROM[0] = 16'h1e00;
		ROM[0] = 16'h0c00;	    			 //power down
		ROM[1] = 16'h1200;
		ROM[2] = 16'h0ec2;	   		    	//master, invert Bclk,16bit, I2Sformat, MSB-F left 1 justified
		//ROM[3] = 16'h0838;	    			 //sound select
		ROM[3] = {8'h08, 2'b00, sound_selector[2:0], 3'b010};
	
		ROM[4] = 16'h1000;					 //sampling ctrl, 48kHz, 48Khz,
		// ROM[4] = {8'h10,8'b00000100};						//sampling ctrl, 48kHz, 8Khz,
		ROM[5] = 16'h0017;					 ////left line in
		ROM[6] = 16'h0217;					 //right line in
		ROM[7] = {8'h04,1'b0,volume[6:0]};		 //
		ROM[8] = {8'h06,1'b0,volume[6:0]};	     //sound vol
	
		//ROM[4]= 16'h1e00;		             //reset	
		ROM[9] = {8'h0A, 8'b00001000}; //digital audio path ctrl, default value
		// ROM[9] = {8'h0A, 8'b00000000}; //digital audio path ctrl, de-mute DAC
		//ROM[9] = {8'h0A, 8'b00001100}; //digital audio path ctrl, de-emp = 44.1Khz
		ROM[`rom_size]= 16'h1201;            //active
		DATA_A=ROM[address];
	end

always @(posedge CLOCK ) 
	begin
		COUNTER_500=COUNTER_500+1;
	end

endmodule
