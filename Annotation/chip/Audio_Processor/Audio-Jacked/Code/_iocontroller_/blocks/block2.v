always@(posedge clk)
	if (reset)
		begin
		LEDS <= 8'd0;
		br_memdata_in <= 0;
		speaker_buffer <= 0;
		spkr_data <= 0;
		mic_start <= 0;
		buffer_updated <= 0;
		end
	else if (memwrite)
		casex (mem_addr)
			


			8'b1xxxxxxx: begin 
							cr_app_data_in <= data_out1[15:0]; 
							mic_start <= 1;
							end
			


			`mic:		mic_start <= 0;
			



			`speaker:	begin spkr_data <= speaker_buffer;
							buffer_updated <= 1; end
			


			`sp_bufr:	begin speaker_buffer <= data_out1[15:0];
							buffer_updated <= 0; end
			
			`leds:		LEDS <= data_out1[7:0];
			
			`block:		br_memdata_in <= data_out1;
		endcase