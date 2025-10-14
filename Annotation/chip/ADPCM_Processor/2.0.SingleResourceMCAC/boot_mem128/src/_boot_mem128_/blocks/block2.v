	generic_sram_byte_en #(
		.DATA_WIDTH     ( WB_DWIDTH    ),
		.ADDRESS_WIDTH  ( MADDR_WIDTH  )
	)
	u_mem (
		.clk            ( clk          ),
		.reset          ( reset        ),
		.scan_enable    ( scan_enable  ),
		.test_mode      ( test_mode    ),
		.i_write_enable ( start_write  ),
		.i_byte_enable  ( byte_enable  ),
		.i_address      ( address      ),  
		.o_read_data    ( read_data    ),
		.i_write_data   ( write_data   )
	);