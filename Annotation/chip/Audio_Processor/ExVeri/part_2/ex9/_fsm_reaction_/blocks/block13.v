	always @ (*)
	begin
				case(state)
					IDLE: begin 
									ledr <= 10'b0000000000;
									en_lfsr <= 1'b1; 
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT0: begin 
									ledr <= 10'b1000000000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b1;
									end
					LIGHT1: begin 
									ledr <= 10'b1100000000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT2: begin 
									ledr <= 10'b1110000000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT3: begin
									ledr <= 10'b1111000000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT4: begin 
									ledr <= 10'b1111100000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT5: begin 
									ledr <= 10'b1111110000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT6: begin
									ledr <= 10'b1111111000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT7: begin
									ledr <= 10'b1111111100; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT8: begin
									ledr <= 10'b1111111110; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					LIGHT9: begin 
									ledr <= 10'b1111111111; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b1;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end
					REACTION: begin 
									ledr <= 10'b0000000000; 
									en_lfsr <= 1'b0;
									start_delay <= 1'b0;
									start_count  <= 1'b1;
									reset_count <= 1'b0;
									end								

					default: ;
				endcase
	end