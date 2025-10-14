//TODO: синхронизация, отладить стабильность вывода на цап
module codec_fsm #(
	parameter OVERSAMPLE 	= 250,
	parameter DATA_WIDTH 	= 32,
	parameter CHANNELS		= 2
)(
	input	wire 						xclk_i,
	input	wire						reset_n,
	
	input	wire	signed	[ 31:0 ] 	right_i,
	input	wire	signed	[ 31:0 ] 	left_i,
	
	output	wire	signed	[ 31:0 ]	right_o,
	output	wire	signed	[ 31:0 ]	left_o,
	output	wire						ready_o,
	
	output	wire						xck_o,
	output 	wire						bclk_o,
	output 	wire						daclrck_o,
	output	wire						dacdat_o,
	output	wire						adclrck_o,
	input	wire						adcdat_i
);
	
	localparam BCLK_VALUE = ( OVERSAMPLE / ( DATA_WIDTH * CHANNELS * 2 ) ) - 1;
	localparam LRCK_VALUE = ( OVERSAMPLE / ( CHANNELS ) ) - 1;
	
	localparam IDLE_S	= 2'b00;
	localparam BCLK_S	= 2'b01;
	
	reg [ 1:0 ] FSM_STATE = IDLE_S;
	reg [ 31:0 ] dac_right = 0, dac_left = 0, adc_left = 0, adc_right = 0, adc_left_reg = 0, adc_right_reg = 0;
	reg [ 10:0 ] bclk_counter = BCLK_VALUE, lrck_counter = 62;
	reg [ $clog2(DATA_WIDTH)-1:0 ] bits_counter = DATA_WIDTH-1;
	reg lrck = 1, bclk = 1, valid_out = 0;
	reg done = 0;
	
	always @( posedge xclk_i )
	begin
		if( reset_n == 1'b0 ) begin
			dac_right 		<= 0;
			dac_left 		<= 0;
			adc_left		<= 0;
			adc_right		<= 0;
			
			lrck			<= 1'b1;
			bclk			<= 1'b1;
			bclk_counter 	<= BCLK_VALUE;
			lrck_counter	<= 62;
			bits_counter	<= 31;
			valid_out		<= 1'b0;
			done 			<= 1'b0;
			
			FSM_STATE 		<= IDLE_S;
		end
		else begin
			case( FSM_STATE )
				IDLE_S : begin
					adc_left_reg	<= adc_left;
					adc_right_reg	<= adc_right;
					valid_out		<= 1'b1;

					dac_right 		<= 0;
					dac_left		<= 0;
					adc_left		<= 0;
					adc_right		<= 0;

					bclk			<= 1'b0;
					bclk_counter 	<= BCLK_VALUE;
					lrck_counter	<= 62;
					bits_counter	<= 31;
					done 			<= 1'b0;

					dac_right 		<= right_i;
					dac_left 		<= left_i;
					lrck			<= 1'b1;
					
					FSM_STATE 		<= BCLK_S;
				end
				
				BCLK_S : begin
					valid_out		<= 1'b0;
					if( bclk_counter == 1'b0 ) begin
						if( bclk == 1'b1 ) begin
							lrck_counter 	<= lrck_counter - 1'b1;
							
							if( lrck == 1'b1 ) begin
								dac_left 	<= {dac_left[30:0], 1'b0};
							end
							else begin
								dac_right 	<= {dac_right[30:0], 1'b0};
							end
						end
						else begin
							if( ~done ) begin
								if( bits_counter == 1'b0 ) done <= 1'b1;
								if( lrck == 1'b1 ) begin
									adc_left		<= {adc_left[30:0], adcdat_i};
									bits_counter	<= bits_counter - 1'b1;
								end
								else begin
									adc_right 		<= {adc_right[30:0], adcdat_i};
									bits_counter 	<= bits_counter - 1'b1;
								end
							end
						end
						
						bclk <= !bclk;
						bclk_counter <= BCLK_VALUE;

						if( lrck == 1'b1 && lrck_counter == 0 ) begin
							lrck 			<= 1'b0;
							lrck_counter	<= 62;
							bits_counter	<= 31;
							done <= 1'b0;
							
							FSM_STATE 		<= BCLK_S;
						end
						if( lrck == 1'b0 && lrck_counter == 0 ) begin
							lrck_counter	<= 62;
							bits_counter	<= 31;
							//valid_out		<= 1'b1;
							done <= 1'b0;
							
							FSM_STATE 		<= IDLE_S;
						end
					end
					else begin
						bclk_counter 	<= bclk_counter - 1'b1;
						
						FSM_STATE 		<= BCLK_S;
					end
				end
				
				default : begin
					FSM_STATE <= IDLE_S;
				end
			endcase
		end
	end

	assign xck_o		= xclk_i;
	assign bclk_o	 	= bclk;
	assign daclrck_o 	= lrck;
	assign adclrck_o 	= lrck;
	assign dacdat_o 	= ( lrck == 1'b0 ) ? (dac_right[31]) : (dac_left[31]);
	
	assign left_o		= adc_left_reg;
	assign right_o		= adc_right_reg;
	assign ready_o		= valid_out;
	
endmodule