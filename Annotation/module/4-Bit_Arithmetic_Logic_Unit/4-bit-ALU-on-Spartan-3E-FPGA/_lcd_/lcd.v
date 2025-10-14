`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		Obaidullah Ahmed
// 
// Create Date:    22:07:18 05/27/2023 
// Design Name: 
// Module Name:    lcd 
// Project Name: ALU_display_on_LCD
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module lcd(clk, sf_e, e, rs, rw, d, c, b, a, data, but_A, but_B, but_op, clr_common,L);

	(* LOC = "C9" *) input clk; // pin C9 is the 50-MHz on-board clock
						  input [3:0] data;
						  input but_A, but_B, but_op, clr_common;
							wire [7:0] w1;
							wire [3:0] A, B, opcode;
							output reg [7:0] L;
	(* LOC = "D16" *) output reg sf_e; // 1 LCD access (0 StrataFlash access)
	(* LOC = "M18" *) output reg e; // enable (1)
	(* LOC = "L18" *) output reg rs; // Register Select (1 data bits for R/W)
	(* LOC = "L17" *) output reg rw; // Read/Write, 1/0
	(* LOC = "M15" *) output reg d; // 4th data bit (to form a nibble)
	(* LOC = "P17" *) output reg c; // 3rd data bit (to form a nibble)
	(* LOC = "R16" *) output reg b; // 2nd data bit (to form a nibble)
	(* LOC = "R15" *) output reg a; // 1st data bit (to form a nibble)
	
	parameter 	add_op = 4'b0000, // mapping opcodes to parameter names
					sub_op = 4'b0001,
					mul_op = 4'b0010,
					div_op = 4'b0011,
					and_op = 4'b0100,
					or_op = 4'b0101,
					xor_op = 4'b0110,
					xnor_op = 4'b0111;
				

ALU_board A1(clk, data, clr_common, w1, but_A, but_B, but_op, A, B, opcode);
	
	
	reg [ 26 : 0 ] count = 0;	// 27-bit count, 0-(128M-1), over 2 secs
	reg [ 5 : 0 ] code;			// 6-bit different signals to give out
	reg refresh;					// refresh LCD rate @ about 25Hz
	
	always @ (posedge clk) begin
		
		assign L = w1;					// assign ALU output to LEDs
		
		count <= count +1;
		case ( count[ 26 : 21 ] )	// as top 6 bits change

			0: code <= 6'h03;			// power-on init sequence
			1: code <= 6'h03;			// this is needed at least once
			2: code <= 6'h03;			// when LCD's powered on
			3: code <= 6'h02;			// it flickers existing char display
			
//  Function Set
// send 00 and upper nibble 0010, then 00 and lower nibble 10xx
			4: code <= 6'h02;			// Function Set, upper nibble 0010
			5: code <= 6'h08;			// lower nibble 1000 (10xx)
			
//  Entry Mode
// send 00 and upper nibble 0000, then 00 and lower nibble 0 1 I/D S
// last 2 bits of lower nibble: I/D bit (Incr 1, Decr 0), S bit (Shift 1, 0 no)
			6: code <= 6'h00; 		// see table, upper nibble 0000, then lower nibble:
			7: code <= 6'h06;			//  0110: Incr, Shift disabled
			
//  Display On/Off
// send 00 and upper nibble 0000, then 00 and lower nibble 1DCB:
// D: 1, show char represented by code in DDR, 0 don't, but code remains
// C: 1, show cursor, 0 don't
// B: 1, cursor blinks (if shown), 0 don't blink (if shown)
			8: code <= 6'h00;			// Display On/Off, upper nibble 0000
			9: code <= 6'h0C;			// lower nibble 1100 (1 D C B)
			
//  Clear Display, 00 and upper nibble 0000, 00 and lower nibble 0001
			10: code <= 6'h00;		// Clear Display, 00 and upper nibble 0000
			11: code <= 6'h01;		// then 00 and lower nibble 0001
			
//  Write Data to DD RAM (or CG RAM)
// Characters are then given out, 1st line
// send 10 and upper nibble 0100, then 10 and lower nibble 1000
			
			12: code <= 6'b100100; 		// A upper nibble
			13: code <= 6'b100001;		// A lower nibble
			14: code <= 6'b100011;		// equals to sign upper nibble
			15: code <= 6'b101101;		// equals to sign lower nibble
			16: code <= 6'b100011;		// upper nibble for all 1-9
			17: code <= {2'b10,A[3:0]}; // lower nibble for 1-9 as selected in register of A
			
			18: code <= 6'b100010;		// space
			19: code <= 6'b100000;
			
			20: code <= 6'b100100;		// B upper nibble and so on
			21: code <= 6'b100010;
			22: code <= 6'b100011;
			23: code <= 6'b101101;
			24: code <= 6'b100011;
			25: code <= {2'b10,B[3:0]};
			
			26: code <= 6'b100010;		// space
			27: code <= 6'b100000;
			
			28: code <= 6'b100100;		// O for operator upper nibble and so on
			29: code <= 6'b101111; 
			30: code <= 6'b100011;
			31: code <= 6'b101101; 
			32: code <= 6'b100010;		// same upper nibble for all symbols as per ASCII table
			33: 								
			begin
				case(opcode)				// select lower nibble for symbol as per opcode
				add_op: code <= 6'b101011;
				sub_op: code <= 6'b101101;
				mul_op: code <= 6'b101010;
				div_op: code <= 6'b101111;
				and_op: code <= 6'b100110;
				or_op: code <= 6'b100001;
				xor_op: code <= 6'b101110;
				xnor_op: code <= 6'b100010;
				endcase
				end
				
				
			
			
// Set DD RAM (DDR) Address
// position the cursor onto the start of the 2nd line
			34: code <= 6'b001100;	// pos cursor to 2nd line upper nibble h40 (...)
			35: code <= 6'b000000;	// lower nibble: h0
// Characters are then given out
			36: code <= 6'b100100;
			37: code <= 6'b100001;
			38: code <= 6'b100110;
			39: code <= 6'b101110;
			40: code <= 6'b100111;
			41: code <= 6'b100011;
			42: code <= 6'b100011;
			43: code <= 6'b101010;
			44: code <= 6'b100010;
			45: code <= 6'b100000;
			
			46: code <= 6'b100011; // same upper nibble for 1-9
			47: code <= {2'b10,w1[3:0]}; // lower nibble as per ALU output	
// Read Busy Flag and Address
// send 01 BF (Busy Flag) x x x, then 01xxxx
// idling
			default: code <= 6'h10;	// the rest un-used time
		endcase
// refresh (enable) the LCD when
			refresh <= count[ 20 ]; // flip rate almost 25 (50Mhz / 2^21-2M)
			sf_e <= 1;
			{ e, rs, rw, d, c, b, a } <= { refresh, code };
	end // always block

endmodule

