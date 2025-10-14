`timescale 1ns / 100ps	//unit time is 1ns, resolutions 100ps

module counter_16(
	clock,
	enable,
	reset,
	count
);

	parameter BIT_SZ = 16;
	input clock;
	input enable;
	input reset;
	output [BIT_SZ-1:0] count;
	
	reg [BIT_SZ-1:0] count;
	
	initial count = 0;
	
	always @ (posedge clock)
		if (reset == 1'b1)
			count <= 1'b0;
		else if(enable == 1'b1)
			count <= count + 1'b1;
endmodule
