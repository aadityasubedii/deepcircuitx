always @(posedge clk)
begin
	if (internal_reset == 1'b1)
	begin
		data_to_transfer		<= 8'h00;
		num_bits_to_transfer	<= 3'h0;
	end
	else if (auto_init_complete == 1'b0)
	begin
		data_to_transfer		<= auto_init_data;
		num_bits_to_transfer	<= 3'h7;
	end
	else if (s_alavon_slave == I2C_STATE_1_START)
	begin
		num_bits_to_transfer <= 3'h7;
		if ((ob_address == 3'h0) & writedata[2])
			data_to_transfer <= 8'h34;
		else if ((ob_address == 3'h4) & writedata[2])
			data_to_transfer <= 8'h40 | writedata[3];
		else
			data_to_transfer <= writedata[7:0];
	end
end