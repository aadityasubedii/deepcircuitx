assign ob_readdata		= readdata;
assign ob_waitrequest	= waitrequest;


assign readdata[31: 8]	= 24'h000000;
assign readdata[ 7: 4]	= (address == 2'h3) ? i2c_received_data[7:4]	: 4'h0;
assign readdata[ 3]		= (address == 2'h1) ? auto_init_error			: 
						  (address == 2'h3) ? i2c_received_data[3]		: 1'b0;
assign readdata[ 2]		= (address == 2'h1) ? ~auto_init_complete		: 
						  (address == 2'h3) ? i2c_received_data[2]		: 1'b0;
assign readdata[ 1]		= (address == 2'h1) ? 
							(s_alavon_slave != I2C_STATE_0_IDLE)		: 
						  (address == 2'h3) ? i2c_received_data[1]		: 1'b0;
assign readdata[ 0]		= (address == 2'h1) ? i2c_ack					: 
						  (address == 2'h3) ? i2c_received_data[0]		: 1'b0;

assign waitrequest = valid_operation & 
			((write & (s_alavon_slave != I2C_STATE_1_START)) |
			(read & ~transfer_complete));

assign address		= ob_address[1:0];
assign byteenable	= ob_byteenable;
assign chipselect	= ob_chipselect;
assign read			= ob_read;
assign write		= ob_write;
assign writedata	= ob_writedata;

assign internal_reset		= 
			reset | 
			(chipselect & byteenable[0] & (address == 2'h0) & 
				write & writedata[0]);

assign valid_operation		= 
			chipselect & byteenable[0] & (
				((address == 2'h0) & write & ~writedata[0]) |
				((address == 2'h2) & write) |
				 (address == 2'h3)
				);

assign clear_status_bits	= chipselect & (address == 2'h1) & write;