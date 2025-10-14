    if ( control_state == SWAP_WAIT1 )
        begin
        barrel_shift_data_sel_nxt   = 2'd1;  
        barrel_shift_amount_sel_nxt = 2'd3;  

        
        if ( i_execute_address[1:0] != 2'd0 )
            barrel_shift_function_nxt = ROR;

        if ( instruction_execute ) 
            begin
            address_sel_nxt             = 4'd3; 
            pc_wen_nxt                  = 1'd0; 
            end

        
        if ( instruction[22] )
            alu_out_sel_nxt = 4'd3;  

        if ( !dabt )
            begin
            
            if ( instruction[15:12]  == 4'd15 )
                begin
                pc_sel_nxt      = 2'd1; 
                address_sel_nxt = 4'd1; 
                end
            else
                reg_bank_wsel_nxt = instruction[15:12];
            end
        end
