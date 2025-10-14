    if ( control_state == MTRANS_EXEC3 && instruction_execute )
        begin
        address_sel_nxt             = 4'd3; 
        pc_wen_nxt                  = 1'd0;  
        barrel_shift_data_sel_nxt   = 2'd1;  

        
        
        if ( instruction[20] && !dabt ) 
            reg_bank_wsel_nxt = mtrans_reg_d2;

        
        if ( {instruction[22],instruction[20],mtrans_r15} == 3'b110 )
            user_mode_regs_load_nxt = 1'd1;

        
        
        if ( {instruction[22],instruction[20]} == 2'b10 )
            o_user_mode_regs_store_nxt = 1'd1;
       end