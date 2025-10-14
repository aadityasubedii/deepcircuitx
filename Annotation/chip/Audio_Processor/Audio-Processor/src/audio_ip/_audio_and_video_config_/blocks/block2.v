Altera_UP_I2C I2C_Controller (
	
	.clk					(CLOCK_50),
	.reset					(reset),

	.clear_ack				(1'b1),

	.clk_400KHz				(clk_400KHz),
	.start_and_stop_en		(start_and_stop_en),
	.change_output_bit_en	(change_output_bit_en),

	.send_start_bit			(send_start_bit),
	.send_stop_bit			(send_stop_bit),

	.data_in				(data_to_transfer),
	.transfer_data			(transfer_data),
	.read_byte				(1'b0),
	.num_bits_to_transfer	(num_bits_to_transfer),

	
	.i2c_sdata				(I2C_SDAT),

	
	.i2c_sclk				(I2C_SCLK),
	.i2c_scen				(),

	.enable_clk				(enable_clk),

	.ack					(i2c_ack),
	.data_from_i2c			(i2c_received_data),
	.transfer_complete		(transfer_complete)
);