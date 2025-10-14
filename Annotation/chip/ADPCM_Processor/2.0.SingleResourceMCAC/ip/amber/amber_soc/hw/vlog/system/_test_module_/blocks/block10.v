always @( posedge i_clk )
    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_FIRQ_TIMER )
        firq_timer <= wb_wdata32[7:0];
    else if ( firq_timer > 8'd1 )
        firq_timer <= firq_timer - 1'd1;