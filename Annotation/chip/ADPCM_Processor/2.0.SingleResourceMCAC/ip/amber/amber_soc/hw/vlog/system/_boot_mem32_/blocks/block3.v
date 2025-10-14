u_mem (
    .i_clk          ( i_wb_clk             ),
    .i_write_enable ( start_write          ),
    .i_byte_enable  ( byte_enable          ),
    .i_address      ( address              ),  
    .o_read_data    ( read_data            ),
    .i_write_data   ( write_data           )
);