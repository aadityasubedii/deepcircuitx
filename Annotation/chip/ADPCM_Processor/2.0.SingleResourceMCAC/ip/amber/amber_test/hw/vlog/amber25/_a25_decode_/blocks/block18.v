    if ( control_state == MTRANS_EXEC1 && !conflict )
        begin
        
        pre_fetch_instruction_wen   = 1'd1;

        if ( instruction_execute ) 
            begin
            daddress_sel_nxt            = 4'd5;  
            decode_daccess_nxt          = 1'd1;  

            if ( mtrans_num_registers > 4'd2 )
                decode_iaccess_nxt      = 1'd0;  


            if ( mtrans_num_registers != 4'd1 )
                begin
                pc_wen_nxt              = 1'd0;  
                iaddress_sel_nxt        = 4'd3;  
                end


            if ( !instruction[20] ) 
                write_data_wen_nxt = 1'd1;

            
            if ( {instruction[22],instruction[20]} == 2'b10 )
                o_user_mode_regs_store_nxt = 1'd1;

            
            if ( instruction[20] && mtrans_reg1 == 4'd15 ) 
                begin
                saved_current_instruction_wen   = 1'd1; 
                pc_wen_nxt                      = 1'd0; 
                load_pc_nxt                     = 1'd1;
                end
            end
        end