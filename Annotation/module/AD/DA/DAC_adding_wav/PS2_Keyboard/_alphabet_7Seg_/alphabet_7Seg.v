/******************************************************************************
 *                                                                            *
 * Module:       alphabet_to_seven_segments                                   *
 * Description:                                                               *
 *      This module converts numbers for alphabet display.                    *
 *                                                                            *
 ******************************************************************************/

module alphabet_to_seven_segments (
	// Inputs
	number,

	// Outputs
	seven_seg_display
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input		[7:0]	number;

// Outputs
output		[6:0]	seven_seg_display;


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign seven_seg_display =
		({7{(number == 8'h1C)}} & 7'b0001000) | //A
		({7{(number == 8'h32)}} & 7'b0000011) | //b
		({7{(number == 8'h21)}} & 7'b1000110) | //C
		({7{(number == 8'h24)}} & 7'b0000110) | //E
		({7{(number == 8'h44)}} & 7'b0100011) | //o
		({7{(number == 8'h31)}} & 7'b0101011) | //n
		({7{(number == 8'h2C)}} & 7'b0000111) | //t
		({7{(number == 8'hF0)}} & 7'b0000000) | //Break code, ON
		({7{((number != 8'h1C) & (number != 8'h32) & (number != 8'h21) & (number != 8'h24) & (number != 8'h44)
          &(number != 8'h31) & (number != 8'h2C) & (number != 8'h1C))}} & 7'b1111111);  //off

endmodule

