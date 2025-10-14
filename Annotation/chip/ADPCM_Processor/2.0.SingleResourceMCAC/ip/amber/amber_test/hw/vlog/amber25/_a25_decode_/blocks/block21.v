    
    
    if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
        begin
        
        
        
        saved_current_instruction_wen   = 1'd1;

        
        
        if ( next_interrupt == 3'd4 )
            reg_write_sel_nxt               = 3'd7;            
        else
            reg_write_sel_nxt               = 3'd1;            

        reg_bank_wen_nxt                = decode (4'd14);  

        iaddress_sel_nxt                = 4'd2;            
        pc_sel_nxt                      = 3'd2;            

        status_bits_mode_nxt            = interrupt_mode;  
        status_bits_mode_wen_nxt        = 1'd1;

        
        status_bits_irq_mask_nxt        = 1'd1;
        status_bits_irq_mask_wen_nxt    = 1'd1;

        
        if ( next_interrupt == 3'd2 ) 
            begin
            status_bits_firq_mask_nxt        = 1'd1;
            status_bits_firq_mask_wen_nxt    = 1'd1;
            end
        end