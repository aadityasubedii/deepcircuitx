//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Peter Cheung
// Version:  1.1
// Date:     24 Jan 2014
//------------------------------

module  processor_echo (sysclk, data_valid, data_in, data_out);

	input				sysclk;
	input 			data_valid;
	input [9:0]		data_in;		// 10-bit input data
	output reg [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
//	reg [9:0] 		data_out_1;
	wire [9:0]		x,y;
	wire[9:0] 		echo;
	wire 				full;
	wire 				wrreq;
	
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'd200;

	reg 				rdreq_dff;
	
	initial 			rdreq_dff = 1'b0; //initially, FIFO is empty
	
	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ECHO.
		
	pulse_gen PULSE(wrreq, data_valid, sysclk); 
	
	always @ (posedge sysclk) 
	begin
		if(full == 1'b1 && wrreq == 1'b1)
			rdreq_dff <= 1'b1;
		else
			rdreq_dff <= 1'b0;
	end
	
	assign y = x - {echo[9], echo[9:1]}; //divide by 2 but keeping the sign bit
	fifo FIFO(sysclk, y, rdreq_dff, wrreq, full, echo);//Send signals to FIFO block

	//  Now clock y output with system clock
	always @ (posedge sysclk)
		data_out <=  y + DAC_OFFSET;

endmodule
	