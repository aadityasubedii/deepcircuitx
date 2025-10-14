generate
	for ( i=0; i<WAYS;i=i+1 ) begin : rams

`ifndef verilog
	generic_sram_line_en_256x21 
	u_tag (
		.A(tag_address),
		.CE(clk),
		.WEB(~tag_wenable_way[i]),
		.OEB(1'b0),
		.CSB(1'b0),
		.I(tag_wdata),
		.O(tag_rdata_way[i])
	);
	
	for (n=0; n<16; n=n+1) begin : mem_gen
		generic_sram_byte_en_256x8
		u_mem (
			.A(data_address),
			.CE(clk),
			.WEB(~data_wenable_way[i]),
			.OEB(1'b0),
			.CSB(1'b0),
			.I(data_wdata[8*(n+1)-1:8*n]),
			.O(data_rdata_way[i][8*(n+1)-1:8*n])	
		);
	end
`else
	generic_sram_line_en #(
		.DATA_WIDTH          ( TAG_WIDTH             ),
		.INITIALIZE_TO_ZERO  ( 1                     ),
		.ADDRESS_WIDTH       ( CACHE_ADDR_WIDTH      ))
	u_tag (
		.clk                 ( clk                   ),
		.reset               ( reset                 ),
		.scan_enable         ( scan_enable           ),
		.test_mode           ( test_mode             ),
		.i_write_data        ( tag_wdata             ),
		.i_write_enable      ( tag_wenable_way[i]    ),
		.i_address           ( tag_address           ),
		.o_read_data         ( tag_rdata_way[i]      )
	);

	generic_sram_byte_en #(
		.DATA_WIDTH          ( CACHE_LINE_WIDTH  ), 
		.ADDRESS_WIDTH       ( CACHE_ADDR_WIDTH  ), 
		.INITIALIZE_TO_ZERO  ( 2                 ))
	u_data (
		.clk                 ( clk                         ),
		.reset               ( reset                       ),
		.scan_enable         ( scan_enable                 ),
		.test_mode           ( test_mode                   ),
		.i_write_data        ( data_wdata                  ),
		.i_write_enable      ( data_wenable_way[i]         ),
		.i_address           ( data_address                ),
		.i_byte_enable       ( {CACHE_LINE_WIDTH/8{1'd1}}  ),
		.o_read_data         ( data_rdata_way[i]           )
	);                                                     
`endif

        
        assign tag_wenable_way[i]  = tag_wenable && ( select_way[i] || source_sel[C_INIT] );

        
        assign data_wenable_way[i] = (source_sel[C_FILL] && select_way[i]) || 
                                     (write_hit && data_hit_way[i] && c_state == CS_IDLE) ||
                                     (consecutive_write && data_hit_way_r[i]);
        
        assign data_hit_way[i]     = tag_rdata_way[i][TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way[i][TAG_ADDR_WIDTH-1:0] == i_address[31:TAG_ADDR32_LSB] &&  
                                     c_state == CS_IDLE;                                                               
    end                                                         
endgenerate