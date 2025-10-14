always @ (en or Start)
begin
	if (Start== 1'b1)
	begin
		data_out   = 16'h0000;
		w_done     = 1'b0;
		data_valid = 1'b0;
	end
	
	else if(en== 1'b1)
	begin
		if (rst== 1'b1)
		begin
			MEM [wr_addr] = 16'h0000;
			
			w_done = 1'b1;
		end
		else
		begin
			if (wr== 1'b1)
			begin
				MEM [wr_addr] = data_in[15:0];
				
				w_done = 1'b1;
			end
			
			else
			begin
				data_out = MEM [rd_addr];
				
				data_valid = 1'b1;
			end
		end
	end
	else
	begin
		w_done = 1'b0;
		data_valid = 1'b0;
		
	end
end