    if ( control_state == MTRANS_EXEC3B && instruction_execute )
        begin
        
        
        pre_fetch_instruction_wen   = 1'd1;

        address_sel_nxt             = 4'd3;  
        pc_wen_nxt                  = 1'd0;  

        
        if ( {instruction[22],instruction[20],mtrans_r15} == 3'b110 )
            user_mode_regs_load_nxt = 1'd1;

        
        if ( {instruction[22],instruction[20]} == 2'b10 )
            o_user_mode_regs_store_nxt = 1'd1;
        end

    if ( control_state == MTRANS_EXEC4 )
        begin
        barrel_shift_data_sel_nxt   = 2'd1;  

        if ( instruction[20] ) 
            begin
            if (!dabt) 
                begin
                if ( mtrans_reg_d2 == 4'd15 ) 
                    begin
                    address_sel_nxt = 4'd1; 
                    pc_sel_nxt      = 2'd1; 
                    pc_wen_nxt      = 1'd1; 

                    
                    
                    
                    
                    if ( instruction[22] )
                         begin
                         status_bits_sel_nxt           = 3'd1; 
                         status_bits_flags_wen_nxt     = 1'd1;

                         
                         if ( i_execute_status_bits[1:0] != USR )
                            begin
                            status_bits_mode_wen_nxt      = 1'd1;
                            status_bits_irq_mask_wen_nxt  = 1'd1;
                            status_bits_firq_mask_wen_nxt = 1'd1;
                            end
                         end
                    end
                else
                    begin
                    reg_bank_wsel_nxt = mtrans_reg_d2;
                    end
                end
            end

           
        if ( dabt )
            begin
            pc_wen_nxt = 1'd0;  
            end

        
        if ( {instruction[22],instruction[20],mtrans_r15} == 3'b110 )
            user_mode_regs_load_nxt = 1'd1;

        
        if ( {instruction[22],instruction[20]} == 2'b10 )
            o_user_mode_regs_store_nxt = 1'd1;
        end