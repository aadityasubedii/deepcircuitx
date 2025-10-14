    
    
    if ( control_state == MULT_STORE )
        begin
        reg_write_sel_nxt     = 3'd2; 
        multiply_function_nxt = o_multiply_function;

        if ( itype == MULT ) 
            reg_bank_wsel_nxt      = instruction[19:16]; 
        else  
            reg_bank_wsel_nxt      = instruction[15:12]; 

        if ( instruction[20] )  
            begin
            status_bits_sel_nxt       = 3'd4; 
            status_bits_flags_wen_nxt = 1'd1;
            end
        end

        
    if ( control_state == MULT_ACCUMU )
        begin
        multiply_function_nxt = o_multiply_function;
        pc_wen_nxt            = 1'd0;  
        address_sel_nxt       = 4'd3;  
        end
