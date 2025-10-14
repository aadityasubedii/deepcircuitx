always @ ( posedge i_clk )
    if ( !i_fetch_stall )
        execute_valid <= i_instruction_valid;
    