        begin
        
        
        pre_fetch_instruction_wen   = 1'd1;

        if ( instruction_execute ) 
            begin
            address_sel_nxt             = 4'd3; 
            pc_wen_nxt                  = 1'd0; 
            end