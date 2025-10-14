always @( posedge i_clk )
    if ( !i_fetch_stall )
        begin
        copro_operation_d1  <= i_copro_operation;
        copro_crn_d1        <= i_copro_crn;
        end