Altera_UP_I2C_AV_Auto_Initialize Auto_Initialize (
	
	.clk				(CLOCK_50),
	.reset				(reset),

	.clear_error		(1'b1),

	.ack				(i2c_ack),
	.transfer_complete	(transfer_complete),

	

	
	.data_out			(auto_init_data),
	.transfer_data		(auto_init_transfer_data),
	.send_start_bit		(auto_init_start_bit),
	.send_stop_bit		(auto_init_stop_bit),

	.auto_init_complete	(auto_init_complete),
	.auto_init_error	(auto_init_error)
);