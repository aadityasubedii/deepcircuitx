always @ (posedge clk or negedge test_reset_n)
begin
	if (~test_reset_n)
	begin
		lb_error <= 'b0;
		test_mask <= 'b1;
		test_case <= 2'b00;
	end
	else
	begin
		
		if (test_mask == (1 << (PAIR_NUM-1)))
		begin
			test_mask <= 'b1;
			test_case <= test_case + 1;
		end
		else
			test_mask <= (test_mask << 1);
			
		
		if ((test_in & test_mask) != test_out)
			lb_error <= lb_error | test_mask;
			
	end
end