always @(posedge sysclk) begin
	if (rst) begin
		state <= st_RESET;
		mem_idle <= 1'b1;
		mem_data_in <= 0;
		current_cmd <= 1;
		MEM_CEN <= 1'b1;
		MEM_OEN <= 1'b1;
		MEM_WEN <= 1'b1;
		MEM_ADDR_OUT <= 0;
		MEM_LBN <= 1;
		MEM_UBN <= 1;		
		end
	else
	case (state)
		st_RESET: begin						
			if (go)
				state <= st_COUNT;
			else
				state <= st_RESET;
			
			if (go) begin					
				MEM_ADDR_OUT <= mem_addr;	
				mem_idle <= 1'b0;			
				current_cmd <= command;		
				MEM_OEN <= ~command;		
				MEM_WEN <= command;
				MEM_CEN <= 1'b0;
				MEM_LBN <= mem_byte_en[0];	
				MEM_UBN <= mem_byte_en[1];
			end
			else begin
				MEM_ADDR_OUT <= 26'hXXXXXXX;	
				current_cmd <= 1'b1;
				mem_idle <= 1'b1;
				MEM_OEN <= 1'b1;
				MEM_WEN <= 1'b1;
				MEM_CEN <= 1'b1;
				MEM_LBN <= 1;
				MEM_UBN <= 1;
			end
		end
		
		st_COUNT: begin
			
			if (((waitcount == 8) && (current_cmd == 0)) || (waitcount == 9))  
				state <= st_HOLD; 
			else
				state <= st_COUNT;
				
			if ((waitcount == 8 ) && (current_cmd == 0)) begin	
				MEM_OEN <= 1'b1;		
				MEM_WEN <= 1'b1;
				MEM_CEN <= 1'b1;
				waitcount <= 0;
				mem_idle <= 1'b1;		
			end
			else if (waitcount == 9) begin	
				MEM_OEN <= 1'b1;			
				MEM_WEN <= 1'b1;
				MEM_CEN <= 1'b1;
				waitcount <= 0;
				mem_idle <= 1'b1;
				if (current_cmd == 1)
					mem_data_in <= outp;	
				else
					$display("Got to 7th waitstate without a read command! (Should never happen.)");
				end
			else							
				waitcount <= waitcount + 1;
		end	
		 st_HOLD: begin
			
			if (waitcount2 == 2)
				state <= st_RESET; 
			else
				state <= st_HOLD;
			
			mem_idle <= 1'b1;
			MEM_OEN <= 1'b1;
			MEM_WEN <= 1'b1;
			MEM_CEN <= 1'b1;
				
			if (waitcount2 == 2)
				waitcount2 <= 0;
			else							
				waitcount2 <= waitcount2 + 1;
		end
	
	endcase
end