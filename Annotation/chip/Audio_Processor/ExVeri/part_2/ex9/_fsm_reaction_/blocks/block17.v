	input count_over;
	output reg start_count;
	output reg reset_count;
	
	
	reg [9:0] ledr;
	reg en_lfsr, start_delay;