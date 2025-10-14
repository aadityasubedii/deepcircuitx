    if ( control_state == MEM_WAIT2 )
        begin
        if ( !dabt )  
            begin
            pc_wen_nxt                  = 1'd0; 

            
            if (( type == TRANS && instruction[15:12]  == 4'd15 ) ||
                ( type == MTRANS && instruction[20] && mtrans_reg1 == 4'd15 ))
                begin
                pc_sel_nxt       = 3'd3; 
                iaddress_sel_nxt = 4'd3; 
                load_pc_nxt      = load_pc_r;
                end
            end
        end