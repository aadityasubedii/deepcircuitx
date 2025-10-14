always @(posedge clock or posedge reset)
	if (reset) begin		
		state <= IDLE;
		status <= 1'b0;
		clear_enable <= 1'b1;
		cmd <= 1'b0;
		internal_output_is_valid <= 1'b0;
		pre_sop_out <= 1'b0;
		pre_eop_out <= 1'b0;
		complete <= 1'b0;
		input_valid_shift_reg <= {READ_LATENCY{1'b0}};
		discard_remaining_data_of_read_word <= 1'b0;
		read <= 1'b0;
		reads_issued <= {PACKET_SAMPLES_REQUIREDWIDTH{1'b0}};
	end
	else begin
		
		
		reads_issued <= read & ena & ~reads_complete ? reads_issued + 1'b1 : reads_issued;
	
		
		
		if(ena) begin
			input_valid_shift_reg[READ_LATENCY-1] <= (read);
			for(i=0;i<READ_LATENCY-1;i=i+1) begin
				input_valid_shift_reg[i] <= input_valid_shift_reg[i+1];
			end
		end
		
		case (state)			
			
			IDLE :	begin
				
				
				reads_issued <= {PACKET_SAMPLES_REQUIREDWIDTH{1'b0}};
			
				
				if( ena & discard_remaining_data_of_read_word) begin
					discard_remaining_data_of_read_word <= 0;
				end
				
				
				clear_enable <= 1'b0;
				
				
				if (pre_eop_out & ena) begin
					pre_eop_out <= 1'b0;			
				end
				
				
				complete <= 1'b0;
				
				if (enable & !discard_remaining_data_of_read_word) begin	
				
					
					
					clear_enable <= 1'b1;
					
					
					status <= 1'b1;
					
					
					
					
					cmd <= 1'b1;
					cmd_addr <= packet_addr;
					cmd_length_of_burst <= packet_words;
					
					packet_samples_reg <= packet_samples;
					
					
					internal_output_is_valid <= 1'b1;
					pre_sop_out <= 1'b1;
					pre_data_out <= packet_type;
					
					
					state <= WAITING;
					
				
				end else begin
					
					status <= 1'b0;
					state <= IDLE;
					cmd <= 1'b0;
					internal_output_is_valid <= 1'b0;
					pre_sop_out <= 1'b0;
				end
			end
			
			
			WAITING : begin 
				 
				
				clear_enable <= 1'b0;				
							
				
				
				if (cmd & ena) begin
					cmd <= 1'b0;			
				end
				
				
				if(ena) begin
					
					internal_output_is_valid <= 1'b0;
					pre_sop_out <= 1'b0;
					state <= RUNNING;
				end
			end

			
			RUNNING : begin
				
				
				
				
				if(ena) begin
					internal_output_is_valid <= input_valid_shift_reg[0];
				end
							
				
				if ((cmd & ena) | !cmd & !reads_complete) begin
					cmd <= 1'b0;
					read <= 1'b1;					
				end			
							
				
				
				if (reads_complete & ena) begin
					
					read <= 1'b0;
				end
				
				
				
				pre_data_out <= ena ? data : pre_data_out;

				
				
				if(input_valid_shift_reg==1 & reads_complete & ena) begin
				
					
					
					discard_remaining_data_of_read_word <= 1;
					
					
					pre_eop_out <= 1'b1;
					
					
					state <= ENDING;
					
				end else begin
					state <= RUNNING;
					pre_eop_out <= 1'b0;
				end
			end
			
			ENDING : begin 
				
				internal_output_is_valid <= 1'b1;
			
				
				if( ena & discard_remaining_data_of_read_word) begin
					discard_remaining_data_of_read_word <= 0;
				end
				
				
				if(ena) begin
					
					status <= 1'b0;
					
					
					complete <= 1'b1;
					pre_eop_out <= 1'b0;
					state <= IDLE;
					internal_output_is_valid <= 1'b0;
				end
				
			end
			
		endcase
	end			