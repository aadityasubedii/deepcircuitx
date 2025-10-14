        
    if ( control_state == MULT_PROC1 && instruction_execute && !conflict )
        begin
        
        
        pre_fetch_instruction_wen   = 1'd1;
        pc_wen_nxt                  = 1'd0;  
        multiply_function_nxt       = o_multiply_function;
        end
