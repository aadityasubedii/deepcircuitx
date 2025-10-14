module ex6_top(
		CLOCK_50,
		KEY,
		HEX0,HEX1,HEX2,HEX3,HEX4,
);
	input CLOCK_50;
	input  [1:0] KEY;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;
	
	//Top level module only has KEY,CLOCK and HEX as in/outputs
	
	//output [3:0] BCD0;
	//output [3:0] BCD1;
	//output [3:0] BCD2;
	//output [3:0] BCD3;
	//output [3:0] BCD4;	
	//output [15:0] count;

	//input and outputs are only for the inputs into the module and outputs
	//wires are used to connect input and output ports of a module instantiation 
	
	wire [3:0] BCD0;
	wire [3:0] BCD1;
	wire [3:0] BCD2;
	wire [3:0] BCD3;
	wire [3:0] BCD4;	
	wire [15:0] count;
	wire tick, enable;
	
	clk_16_tick 	TICK (CLOCK_50, tick);//count up to 50000
	
	assign enable = (tick & ~KEY[0]); //Key[0] is active low
	
	counter_16		CNTR (CLOCK_50,enable,~KEY[1],count);
	bin2bcd_16		CVRT (count,BCD0,BCD1,BCD2,BCD3,BCD4);
	hex_to_7seg		SEG0 (HEX0, BCD0);
	hex_to_7seg		SEG1 (HEX1, BCD1);
	hex_to_7seg		SEG2 (HEX2, BCD2);
	hex_to_7seg		SEG3 (HEX3, BCD3);
	hex_to_7seg		SEG4 (HEX4, BCD4);

endmodule