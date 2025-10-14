module synth_processor (sw, sysclk, data_valid, data_in, data_out);

	input [8:0] 	sw;
	input				sysclk;		// system clock
	input				data_valid;
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	
	wire [9:0]		x,y;
	wire [8:0] 		echo;
	wire 				enwrrd;
	
	wire [12:0] 	readaddr, writeaddr;
	
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;
	
	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
		
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	
	assign writeaddr = readaddr + {sw, 4'b0};
	
	pulse_gen PG(sysclk, data_valid, enwrrd);
	
	ram_2port RAM(sysclk, y[9:1], readaddr, enwrrd, writeaddr, enwrrd, echo);
	
	counter_13 counter(data_valid, 1'b1, 1'b0, readaddr);
	
	assign y = x - {echo[8], echo[8:1]}; //Divide by 2 but keep the sign bit;
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	