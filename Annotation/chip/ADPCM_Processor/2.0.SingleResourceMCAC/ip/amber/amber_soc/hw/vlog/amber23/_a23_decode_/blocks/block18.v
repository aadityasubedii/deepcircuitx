    if ( control_state == MTRANS5_ABORT )
        begin
        
        
        if (restore_base_address) 
            begin
            reg_write_sel_nxt = 3'd6;                        
            reg_bank_wsel_nxt  = instruction[19:16];         
            end
        end