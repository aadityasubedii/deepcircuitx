always @(posedge clk)
begin
	if (reset)
	begin
		data_to_transfer		<= 8'h00;
		num_bits_to_transfer	<= 3'h0;
	end
	else
		if (auto_init_complete == 1'b0)
		begin
			data_to_transfer		<= auto_init_data;
			num_bits_to_transfer	<= 3'h7;
		end
end