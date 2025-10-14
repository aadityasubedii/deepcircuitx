always @ ( posedge i_clk )
    if ( !i_fetch_stall )
        begin
        
        
        
        
        
        if      (itype == MTRANS)
            begin
            saved_current_instruction              <= mtrans_instruction_nxt;
            saved_current_instruction_iabt         <= instruction_iabt;
            saved_current_instruction_adex         <= instruction_adex;
            saved_current_instruction_address      <= instruction_address;
            saved_current_instruction_iabt_status  <= instruction_iabt_status;
            end
        else if (saved_current_instruction_wen)
            begin
            saved_current_instruction              <= instruction;
            saved_current_instruction_iabt         <= instruction_iabt;
            saved_current_instruction_adex         <= instruction_adex;
            saved_current_instruction_address      <= instruction_address;
            saved_current_instruction_iabt_status  <= instruction_iabt_status;
            end

        if      (pre_fetch_instruction_wen)
            begin
            pre_fetch_instruction                  <= o_read_data;
            pre_fetch_instruction_iabt             <= iabt_reg;
            pre_fetch_instruction_adex             <= adex_reg;
            pre_fetch_instruction_address          <= abt_address_reg;
            pre_fetch_instruction_iabt_status      <= abt_status_reg;
            end
        end