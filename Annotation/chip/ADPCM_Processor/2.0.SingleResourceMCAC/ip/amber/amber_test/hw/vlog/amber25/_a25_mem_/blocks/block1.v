a25_dcache u_dcache (
	.clk                      ( clk                 ),
	.reset                    ( reset               ),
	.scan_enable              ( scan_enable         ),
	.test_mode                ( test_mode           ),

    .i_fetch_stall              ( i_fetch_stall         ),
    .i_exec_stall               ( i_exec_stall          ),
    .o_stall                    ( cache_stall           ),
     
    .i_request                  ( sel_cache_p           ),
    .i_exclusive                ( i_exclusive           ),
    .i_write_data               ( i_write_data          ),
    .i_write_enable             ( i_write_enable        ),
    .i_address                  ( i_daddress            ),
    .i_address_nxt              ( i_daddress_nxt        ),
    .i_byte_enable              ( i_byte_enable         ),

    .i_cache_enable             ( i_cache_enable        ),
    .i_cache_flush              ( i_cache_flush         ),
    .o_read_data                ( cache_read_data       ),
    
    .o_wb_cached_req            ( cached_wb_req         ),
    .i_wb_cached_rdata          ( i_wb_cached_rdata     ),
    .i_wb_cached_ready          ( i_wb_cached_ready     )
);