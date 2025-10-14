always @*
casez (lsr_selector) 
	7'b1??:	lsr_mask =  33'h_1_0000_0000;
	7'b01?:	lsr_mask =  33'h_0_0000_0000;
	7'b000:	lsr_mask = { 1'h_1, bit_swap(low_mask), 16'h_ffff};
	7'b001:	lsr_mask = {17'h_1_0000, bit_swap(low_mask)};
endcase