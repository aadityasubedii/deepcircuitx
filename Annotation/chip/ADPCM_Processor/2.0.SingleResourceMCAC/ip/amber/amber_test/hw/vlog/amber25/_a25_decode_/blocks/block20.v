    
    if ( control_state == MEM_WAIT1 && !conflict )
        begin
        
        
        pre_fetch_instruction_wen   = 1'd1;

        if ( instruction_execute ) 
            begin
            iaddress_sel_nxt            = 4'd3; 
            pc_wen_nxt                  = 1'd0; 
            load_pc_nxt                 = load_pc_r;
            end
        end