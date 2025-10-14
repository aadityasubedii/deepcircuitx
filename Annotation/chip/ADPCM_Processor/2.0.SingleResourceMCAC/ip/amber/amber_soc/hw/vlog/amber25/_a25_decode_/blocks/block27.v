always @( posedge i_clk )
    if ( !i_core_stall )
        begin
        conflict_r              <= conflict;
        instruction_execute_r   <= instruction_execute;
        rn_conflict1_r          <= rn_conflict1 && instruction_execute;
        rm_conflict1_r          <= rm_conflict1 && instruction_execute;
        rs_conflict1_r          <= rs_conflict1 && instruction_execute;
        rd_conflict1_r          <= rd_conflict1 && instruction_execute;
        o_rn_use_read           <= instruction_valid && ( rn_conflict1_r || rn_conflict2 );
        o_rm_use_read           <= instruction_valid && ( rm_conflict1_r || rm_conflict2 );
        o_rs_use_read           <= instruction_valid && ( rs_conflict1_r || rs_conflict2 );
        o_rd_use_read           <= instruction_valid && ( rd_conflict1_r || rd_conflict2 );
        end