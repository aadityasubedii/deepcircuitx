    
    if ( control_state == MULT_ACCUMU )
        begin
        multiply_function_nxt = o_multiply_function;
        pc_wen_nxt            = 1'd0;  
        iaddress_sel_nxt      = 4'd3;  
        end