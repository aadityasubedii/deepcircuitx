always @( posedge i_clk )
    if ( !i_core_stall )
        begin
        copro_operation_d1  <= i_copro_operation;
        copro_crn_d1        <= i_copro_crn;
        end