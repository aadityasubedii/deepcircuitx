					IDLE: begin 
									ledr <= 10'b0000000000;
									en_lfsr <= 1'b1; 
									start_delay <= 1'b0;
									start_count  <= 1'b0;
									reset_count <= 1'b0;
									end