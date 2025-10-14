    if ( control_state == MTRANS_EXEC2 )
        begin
        daddress_sel_nxt            = 4'd5;  
        decode_daccess_nxt          = 1'd1;  

        if ( mtrans_num_registers > 4'd2 )
            begin
            decode_iaccess_nxt      = 1'd0;  
            end

        if ( mtrans_num_registers > 4'd1 )
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


    
    if ( control_state == MTRANS_ABORT )
        begin
        
        
        if (restore_base_address) 
            begin
            reg_write_sel_nxt = 3'd6;                        
            reg_bank_wen_nxt  = decode ( instruction[19:16] ); 
            end
        end
