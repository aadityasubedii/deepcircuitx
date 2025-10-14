always @*
casez (lsl_selector) 
	7'b1??:	lsl_mask =  33'h_1_0000_0000;
	7'b01?:	lsl_mask =  33'h_0_0000_0000;
	7'b001:	lsl_mask = { 1'h_1, low_mask, 16'h_0000};
	7'b000:	lsl_mask = {17'h_1_ffff, low_mask};
endcase