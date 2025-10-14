    if ( control_state == SWAP_WRITE && instruction_execute )
        begin
        barrel_shift_data_sel_nxt       = 2'd2; 
        address_sel_nxt                 = 4'd4; 
        write_data_wen_nxt              = 1'd1;
        data_access_exec_nxt            = 1'd1; 
                                                

        if ( instruction[22] )
            byte_enable_sel_nxt = 2'd1;         

        if ( instruction_execute )                         
            pc_wen_nxt                  = 1'd0; 

        
        
        pre_fetch_instruction_wen   = 1'd1;

        end
