    
    if ( control_state == COPRO_WAIT && instruction_execute && !conflict )
        begin
        pre_fetch_instruction_wen = 1'd1;

        if ( instruction[20] ) 
            begin
            
            if ( instruction[15:12]  == 4'd15 )
                begin
                
                
                status_bits_sel_nxt           = 3'd3;  
                status_bits_flags_wen_nxt     = 1'd1;

                
                if ( i_execute_status_bits[1:0] != USR )
                   begin
                   status_bits_mode_wen_nxt      = 1'd1;
                   status_bits_irq_mask_wen_nxt  = 1'd1;
                   status_bits_firq_mask_wen_nxt = 1'd1;
                   end
                end
            else
                reg_bank_wen_nxt = decode (instruction[15:12]);

            reg_write_sel_nxt = 3'd5;     
            end
        else 
            begin
            copro_operation_nxt      = 2'd2;  
            end