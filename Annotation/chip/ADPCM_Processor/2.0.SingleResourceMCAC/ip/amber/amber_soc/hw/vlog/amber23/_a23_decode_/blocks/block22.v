    if ( control_state == MTRANS_EXEC1 )
        begin
        
        
        pre_fetch_instruction_wen   = 1'd1;

        if ( instruction_execute ) 
            begin
            address_sel_nxt             = 4'd5;  
            pc_wen_nxt                  = 1'd0;  
            data_access_exec_nxt        = 1'd1;  
                                                 

            if ( !instruction[20] ) 
                write_data_wen_nxt = 1'd1;

            
            
            if ( {instruction[22:20],mtrans_r15} == 4'b1010 )
                user_mode_regs_load_nxt = 1'd1;

            
            
            if ( {instruction[22:20]} == 3'b100 )
                o_user_mode_regs_store_nxt = 1'd1;
            end
        end