always@(posedge clk37)
begin
	
	if(~reset) begin
		address <= 0;
	end
	
	else if(status)begin 
		case (state)
	
		8'h00: begin
		if(record)
			state <= 8'h01;
		else if(play && (address < max_ram_address)) begin
			address <= 0;
			state <= 8'h03;
		end
		else if(delete)
			state <= 8'h00;
		else if(pause)
			state <= 8'h06;
		else if(delete_all) begin
			address <= 0;
			state <= 8'h17;
		end
		else
			state <= 8'h00;
		
		count <= 0;		
		playback <= 0;
		end
		
		
		
		
	
		8'h11: begin
			address <= 0;
			state <= 8'h01;
		end
		
		8'h01: begin
			playback <= 0;
			LEDRAM <= 1'b0;
			if(count < 350) begin
				count <= count + 1;
				state <= 8'h01;
			end
			else if(record) begin
			RAMin <= audio_output;
			state <= 8'h12;
			end
			else begin
				state <= 8'h00;
				count <= 0;
				address <= 0;
			end
		end
		
		8'h12: begin
			enableWrite <= 1'b1;
			state <= 8'h02;
		end
		
		8'h02: begin
			count <= 0;
			enableWrite <= 1'b0;
			address <= address + 1;
			if(address >= max_ram_address) begin
				LEDRAM <= 1'b1;
				state <= 8'h00;
			end
			else	begin
				state <= 8'h01;
				STATLED2 <= 1;
			end
		end
		
		
		
		
		
		8'h03: begin
			playback <= 1;
			if(play) 
				state <= 8'h14;
			else
				state <= 8'h00;
		end
			
			
		8'h14: begin
			if (count < 350) begin
				count <= count + 1;
				state <= 8'h14;
			end
			else state <= 8'h24;
			end
			
		8'h24: begin
			enableWrite <= 1'b0;
			reqRead <= 1'b1;			
			state <= 8'h04;
		end
			
		8'h04: begin
			reqRead <= 1'b0;
			if(dataPresent) begin
				mem_out <= RAMout;
				ackRead <= 1'b1;
				state <= 8'h05;
			end
			
			else begin
				reqRead <= 1'b1;
				state <= 8'h04;
			end
		end
		
		8'h05: begin
			ackRead <= 1'b0;
			address <= address + 1;
			count <= 0;
			if (address >= max_ram_address) begin
				state <= 8'h00;
			end
			
			else
				state <= 8'h03;
		end
		
	
		8'h06: begin
			if(pause)
				state <= 8'h06;
			else if(play) 
				state <= 8'h03;
			else begin
				address <= 0;
				state <= 8'h00;
			end
		end
		
		
	
	
		8'h17: begin
			address <= 0;
			state <= 8'h07;
		end
		
		8'h07: begin
			playback <= 0;
			if(delete_all) begin
			RAMin <= 0;
			state <= 8'h18;
			end
			
			else begin
				address <= 0;
				state <= 8'h00;
			end
		end
		
		8'h18: begin
			enableWrite <= 1'b1;
			state <= 8'h08;
		end
		
		8'h08: begin
			enableWrite <= 1'b0;
			address <= address + 1;
			if(address >= max_ram_address) begin
				LEDRAM <= 1'b0;
				deletedall <= 1;
				address <= 0;
				state <= 8'h00;
				end
				else	begin
					deletedall <= 0;
					state <= 8'h07;
				end
			end
		
		
	endcase
	end
end