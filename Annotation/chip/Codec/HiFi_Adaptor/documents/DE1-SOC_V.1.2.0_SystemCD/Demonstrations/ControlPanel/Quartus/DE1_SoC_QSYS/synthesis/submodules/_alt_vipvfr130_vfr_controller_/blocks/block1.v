	always @(posedge clock or posedge reset) begin
		if (reset) begin
			state <= IDLE;		
			bank_to_read <= 0;
			master_write <= 0;
			master_writedata <= 0;
			master_address <= 0;
			do_control_packet <= 0;
			width_of_next_vid_packet <=0;
			height_of_next_vid_packet <=0;
			interlaced_of_next_vid_packet <=0;
			running<=0;
			frame_complete<=0;
			
		end	else begin
			case (state)
				
				
				IDLE :	begin
					
					master_write<=0;
					
					
					frame_complete<=0;
					if(go_bit) begin
						state <= SENDING_ADDRESS;
						bank_to_read <= next_bank;
						running<=1;				
					end
				end
				
				
				
				
				
				SENDING_ADDRESS :	begin 
					state <= SENDING_SAMPLES;
					master_address <= PACKET_READER_PACKET_ADDRESS_ADDRESS;
					master_write <= 1;
					do_control_packet <= 1;
					if(bank_to_read==0) begin					
						master_writedata <= vid_packet_base_address_bank0;
						width_of_next_vid_packet <= ctrl_packet_width_bank0;
						height_of_next_vid_packet <= ctrl_packet_height_bank0;
						interlaced_of_next_vid_packet <= ctrl_packet_interlaced_bank0;
					end else begin
						master_writedata <= vid_packet_base_address_bank1;
						width_of_next_vid_packet <= ctrl_packet_width_bank1;
						height_of_next_vid_packet <= ctrl_packet_height_bank1;
						interlaced_of_next_vid_packet <= ctrl_packet_interlaced_bank1;
					end				
				end
				
				
				
				SENDING_SAMPLES :	begin 
					state <= SENDING_WORDS;
					
					do_control_packet <= 0;
					master_address <= PACKET_READER_PACKET_SAMPLES_ADDRESS;
					master_write <= 1; 
					if(bank_to_read==0) begin					
						master_writedata <= vid_packet_samples_bank0;
					end else begin
						master_writedata <= vid_packet_samples_bank1;
					end				
				end
				
				
				
				SENDING_WORDS :	begin 
					state <= SENDING_TYPE;
					master_address <= PACKET_READER_PACKET_WORDS_ADDRESS;
					master_write <= 1; 
					if(bank_to_read==0) begin					
						master_writedata <= vid_packet_words_bank0;
					end else begin
						master_writedata <= vid_packet_words_bank1;
					end				
				end
				
				
				
				
				
				SENDING_TYPE :	begin 
					state <= SENDING_GO_AND_ENABLE_INTERRUPT;
					master_address <= PACKET_READER_PACKET_TYPE_ADDRESS;
					master_write <= 1; 
					master_writedata <= 0; 
				end
				
				
				
				SENDING_GO_AND_ENABLE_INTERRUPT :	begin 
					state <= WAITING_END_FRAME;
					master_address <= PACKET_READER_GO_ADDRESS;
					master_write <= 1; 
					master_writedata <= 3; 
				end
				
				
				WAITING_END_FRAME	: begin
					master_address <= PACKET_READER_INTERRUPT_ADDRESS;
					master_writedata <= 2;
					master_write <= 0; 
					
					
					if(master_interrupt_recieve) begin
						state <= IDLE;
						running <= 0;
						
						
						frame_complete <=1;
						
						master_write <= 1;
					end
				end
			endcase
		end
	end	