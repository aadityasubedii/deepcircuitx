	generate
		if( DATA_BYTE_WIDTH == 1 ) begin
			assign wr_data_in = {data_in,data_in,data_in,data_in};
			
			assign write_mask = (address[0])?((address[1])?4'b1110:4'b1011):((address[1])?4'b1101:4'b0111);
			assign data_out = (address[0])?((address[1])?ram_rd_bus[7:0]:ram_rd_bus[23:16]):((address[1])?ram_rd_bus[15:8]:ram_rd_bus[31:24]);
			assign max_ram_address = 26'h1FFFFFF;
			assign ram_cmd_byte_addr = {address[25:2],2'b00};
		end else if( DATA_BYTE_WIDTH == 2 ) begin
			assign wr_data_in = {data_in,data_in};
			assign write_mask = (address[0])?4'b1100:4'b0011;
			assign data_out = (address[0])?ram_rd_bus[15:0]:ram_rd_bus[31:16];
			assign max_ram_address = 26'h0FFFFFF;
			assign ram_cmd_byte_addr = {address[24:1],2'b00};
		end else if ( DATA_BYTE_WIDTH == 4 ) begin
			assign wr_data_in = data_in;
			assign write_mask = 4'b0000;
			assign data_out = ram_rd_bus;
			assign max_ram_address = 26'h07FFFFF;
			assign ram_cmd_byte_addr = {address[23:0],2'b00};
		end
	endgenerate