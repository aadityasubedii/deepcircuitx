always @( posedge i_clk )
    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_STATUS )
        test_status_set <= 1'd1;     
