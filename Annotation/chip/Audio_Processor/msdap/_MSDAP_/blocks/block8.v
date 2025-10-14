always @ (negedge Reset or posedge valid or posedge Start)
begin
	if (Reset == 1'b0)
	begin
		rr_ptr_buff = 4'h0;
		hr_ptr_buff = 9'h000;
		
	end
	else if(Start== 1'b1)
	begin
		rr_ptr_buff = 4'h0;
		hr_ptr_buff = 9'h000;
		
	end
	else
	begin
		if (r_valid)
		begin
			rr_ptr_buff = rr_ptr + 1'b1;
		end
		



		if (h_valid)
		begin
			hr_ptr_buff = hr_ptr + 1'b1;
		end
		
	end
end