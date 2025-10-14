module Go_to_seven_segments (
	// Inputs
	go,

	// Outputs
	seven_seg_display,
  seven_seg_display1
);

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input		go;
// Outputs
output		[6:0]	seven_seg_display;
output		[6:0]	seven_seg_display1;


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign seven_seg_display =
		({7{(go == 1)}} & 7'b0000010) | //G
		({7{(go == 0)}} & 7'b1111111) ; //OFF

assign seven_seg_display1 = 
		({7{(go == 1)}} & 7'b0100011) | //o
		({7{(go == 0)}} & 7'b1111111) ; //OFF

endmodule
