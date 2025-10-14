	generate
		for (n=0; n<16; n=n+1) begin : mem_gen
			generic_sram_byte_en_1024x8
			u_mem (
				.A(address),
				.CE(clk),
				.WEB(~(byte_enable[n] & start_write)),
				.OEB(1'b0),
				.CSB(1'b0),
				.I(write_data[8*(n+1)-1:8*n]),
				.O(read_data[8*(n+1)-1:8*n])
			);
		end
	endgenerate