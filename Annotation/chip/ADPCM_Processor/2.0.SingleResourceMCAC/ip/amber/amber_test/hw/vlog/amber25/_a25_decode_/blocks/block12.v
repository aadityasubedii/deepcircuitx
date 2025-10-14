    if ( control_state == SWAP_WAIT1 )
        begin

        if ( instruction_execute ) 
            begin
            iaddress_sel_nxt            = 4'd3; 
            pc_wen_nxt                  = 1'd0; 
            end

        if ( !dabt )
            begin
            
            if ( instruction[15:12]  == 4'd15 )
                begin
                pc_sel_nxt       = 3'd3; 
                iaddress_sel_nxt = 4'd3; 
                load_pc_nxt      = load_pc_r;
                end
            end
        end