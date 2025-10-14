    if ( control_state == MULT_PROC1 && instruction_execute )
        begin
        
        
        pre_fetch_instruction_wen   = 1'd1;
        pc_wen_nxt                  = 1'd0;  
        multiply_function_nxt       = o_multiply_function;
        end


        
        
        
    if ( control_state == MULT_PROC2 )
        begin
        
        
        pc_wen_nxt              = 1'd0;  
        address_sel_nxt         = 4'd3;  
        multiply_function_nxt   = o_multiply_function;