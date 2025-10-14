always @ (rd_en or Start)
begin
	if(Start== 1'b1)
	begin
		data_out   = 16'h0000;
		data_valid = 1'b0;
	end
	else if(rd_en== 1'b1)
	begin
		data_out = MEM [rd_addr];
		
		data_valid = 1'b1;	
	end
	else
	begin
		data_valid = 1'b0;
		
	end
end