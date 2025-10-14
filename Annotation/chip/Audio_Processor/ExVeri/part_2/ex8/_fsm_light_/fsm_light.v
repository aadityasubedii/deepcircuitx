module fsm_light(
	clk,
	tick,
	trigger,
	time_out,
	en_lfsr,
	start_delay,
	ledr
);

	input clk, tick, trigger,time_out;
	output en_lfsr, start_delay;
	output [9:0] ledr;
	
	reg [9:0] ledr;
	reg en_lfsr, start_delay;

	//Defining each of our states using one-hot encoding
	parameter IDLE = 11'b00000000001;
	parameter LIGHT0 = 11'b00000000010;
	parameter LIGHT1 = 11'b00000000100;
	parameter LIGHT2 = 11'b00000001000;
	parameter LIGHT3 = 11'b00000010000;
	parameter LIGHT4 = 11'b00000100000;
	parameter LIGHT5 = 11'b00001000000;
	parameter LIGHT6 = 11'b00010000000;
	parameter LIGHT7 = 11'b00100000000;
	parameter LIGHT8 = 11'b01000000000;
	parameter LIGHT9 = 11'b10000000000;

	//setting up initial state for switch case
	reg [10:0] state;
	initial state = IDLE;	
	initial en_lfsr = 1'b0;
	initial start_delay = 1'b0;
	
	//transitions
	always @ (posedge tick)
	begin
				case(state)
					IDLE: if(trigger == 1'b1) state<= LIGHT0;
					LIGHT0: if(tick == 1'b1) state <= LIGHT1;
					LIGHT1: if(tick == 1'b1) state <= LIGHT2;
					LIGHT2: if(tick == 1'b1) state <= LIGHT3;
					LIGHT3: if(tick == 1'b1) state <= LIGHT4;
					LIGHT4: if(tick == 1'b1) state <= LIGHT5;
					LIGHT5: if(tick == 1'b1) state <= LIGHT6;
					LIGHT6: if(tick == 1'b1) state <= LIGHT7;
					LIGHT7: if(tick == 1'b1) state <= LIGHT8;
					LIGHT8: if(tick == 1'b1) state <= LIGHT9;
					LIGHT9: if(time_out == 1'b1) state <= IDLE;
					default: ;
				endcase
	end
	
	//Output for each state
	always @ (*)
	begin
				case(state)
					IDLE: begin //no lights
									ledr <= 10'b0000000000;
									en_lfsr <= 1'b1; //request random number
									start_delay <= 1'b0;
									end
					LIGHT0: begin //start lights
									ledr <= 10'b1000000000; //LED9
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT1: begin 
									ledr <= 10'b1100000000; //LED9-8
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT2: begin 
									ledr <= 10'b1110000000; //LED9-7
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT3: begin
									ledr <= 10'b1111000000; //LED9-6
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT4: begin 
									ledr <= 10'b1111100000; //LED9-5
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT5: begin 
									ledr <= 10'b1111110000; //LED9-4
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT6: begin
									ledr <= 10'b1111111000; //LED9-3
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT7: begin
									ledr <= 10'b1111111100; //LED9-2
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT8: begin
									ledr <= 10'b1111111110; //LED9-1
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									end
					LIGHT9: begin 
									ledr <= 10'b1111111111; //LED9-0
									en_lfsr <= 1'b0;
									start_delay <= 1'b1;
									end

					default: ;
				endcase
	end
										
	
endmodule 
