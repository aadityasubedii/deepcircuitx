always @*
    begin
    
    status_bits_mode_nxt            = i_execute_status_bits[1:0];   
                                                                    
    status_bits_irq_mask_nxt        = status_bits_irq_mask_r;
    status_bits_firq_mask_nxt       = status_bits_firq_mask_r;
    decode_exclusive_nxt            = 1'd0;
    decode_daccess_nxt              = 1'd0;
    decode_iaccess_nxt              = 1'd1;
    copro_operation_nxt             = 'd0;

    
    saved_current_instruction_wen   = 1'd0;
    pre_fetch_instruction_wen       = 1'd0;
    restore_base_address_nxt        = restore_base_address;

    
    barrel_shift_amount_sel_nxt     = 'd0;  
    barrel_shift_data_sel_nxt       = 'd0;  
    barrel_shift_function_nxt       = 'd0;
    use_carry_in_nxt                = 'd0;
    multiply_function_nxt           = 'd0;
    iaddress_sel_nxt                = 'd0;
    daddress_sel_nxt                = 'd0;
    pc_sel_nxt                      = 'd0;
    load_pc_nxt                     = 'd0;
    byte_enable_sel_nxt             = 'd0;
    status_bits_sel_nxt             = 'd0;
    reg_write_sel_nxt               = 'd0;
    o_user_mode_regs_store_nxt      = 'd0;

    
    alu_swap_sel_nxt                = 'd0;
    alu_not_sel_nxt                 = 'd0;
    alu_cin_sel_nxt                 = 'd0;
    alu_cout_sel_nxt                = 'd0;
    alu_out_sel_nxt                 = 'd0;

    
    write_data_wen_nxt              = 'd0;
    copro_write_data_wen_nxt        = 'd0;
    base_address_wen_nxt            = 'd0;
    pc_wen_nxt                      = 'd1;
    reg_bank_wen_nxt                = 'd0;  

    status_bits_flags_wen_nxt       = 'd0;
    status_bits_mode_wen_nxt        = 'd0;
    status_bits_irq_mask_wen_nxt    = 'd0;
    status_bits_firq_mask_wen_nxt   = 'd0;

    if ( instruction_valid && !interrupt && !conflict )
        begin
        if ( type == REGOP )
            begin
            if ( !opcode_compare )
                begin
                
                if (instruction[15:12]  == 4'd15)
                    begin
                    pc_sel_nxt       = 3'd1; 
                    iaddress_sel_nxt = 4'd1; 
                    end
                else
                    reg_bank_wen_nxt = decode (instruction[15:12]);
                end

            if ( !immediate_shift_op )
                begin
                barrel_shift_function_nxt  = instruction[6:5];
                end

            if ( !immediate_shift_op )
                barrel_shift_data_sel_nxt = 2'd2; 

            if ( !immediate_shift_op && instruction[4] )
                barrel_shift_amount_sel_nxt = 2'd1; 

            if ( !immediate_shift_op && !instruction[4] )
                barrel_shift_amount_sel_nxt = 2'd2; 

            
            if ( opcode == AND || opcode == EOR || opcode == TST || opcode == TEQ ||
                 opcode == ORR || opcode == MOV || opcode == BIC || opcode == MVN )
                status_bits_sel_nxt = 3'd5;

            if ( opcode == ADD || opcode == CMN )   
                begin
                alu_out_sel_nxt  = 4'd1; 
                use_carry_in_nxt = shift_extend;
                end

            if ( opcode == ADC ) 
                begin
                alu_out_sel_nxt  = 4'd1; 
                alu_cin_sel_nxt  = 2'd2; 
                use_carry_in_nxt = shift_extend;
                end

            if ( opcode == SUB || opcode == CMP ) 
                begin
                alu_out_sel_nxt  = 4'd1; 
                alu_cin_sel_nxt  = 2'd1; 
                alu_not_sel_nxt  = 1'd1; 
                end

            
            
            
            
            if ( opcode == SBC ) 
                begin
                alu_out_sel_nxt  = 4'd1; 
                alu_cin_sel_nxt  = 2'd2; 
                alu_not_sel_nxt  = 1'd1; 
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == RSB ) 
                begin
                alu_out_sel_nxt  = 4'd1; 
                alu_cin_sel_nxt  = 2'd1; 
                alu_not_sel_nxt  = 1'd1; 
                alu_swap_sel_nxt = 1'd1; 
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == RSC ) 
                begin
                alu_out_sel_nxt  = 4'd1; 
                alu_cin_sel_nxt  = 2'd2; 
                alu_not_sel_nxt  = 1'd1; 
                alu_swap_sel_nxt = 1'd1; 
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == AND || opcode == TST ) 
                begin
                alu_out_sel_nxt  = 4'd8;  
                alu_cout_sel_nxt = 1'd1;  
                end

            if ( opcode == EOR || opcode == TEQ ) 
                begin
                alu_out_sel_nxt = 4'd6;  
                alu_cout_sel_nxt = 1'd1; 
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == ORR )
                begin
                alu_out_sel_nxt  = 4'd7; 
                alu_cout_sel_nxt = 1'd1;  
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == BIC ) 
                begin
                alu_out_sel_nxt  = 4'd8;  
                alu_not_sel_nxt  = 1'd1;  
                alu_cout_sel_nxt = 1'd1;  
                use_carry_in_nxt = 1'd1;
               end

            if ( opcode == MOV ) 
                begin
                alu_cout_sel_nxt = 1'd1;  
                use_carry_in_nxt = 1'd1;
                end

            if ( opcode == MVN ) 
                begin
                alu_not_sel_nxt  = 1'd1; 
                alu_cout_sel_nxt = 1'd1;  
                use_carry_in_nxt = 1'd1;
               end
            end

        
        if ( mem_op )
            begin
            if ( load_op && instruction[15:12]  == 4'd15 ) 
                begin
                saved_current_instruction_wen   = 1'd1; 
                pc_wen_nxt                      = 1'd0; 
                load_pc_nxt                     = 1'd1;
                end

            decode_daccess_nxt              = 1'd1; 
            alu_out_sel_nxt                 = 4'd1; 

            if ( !instruction[23] )  
                begin
                alu_cin_sel_nxt  = 2'd1; 
                alu_not_sel_nxt  = 1'd1; 
                end

            if ( store_op )
                begin
                write_data_wen_nxt = 1'd1;
                if ( type == TRANS && instruction[22] )
                    byte_enable_sel_nxt = 2'd1;         
                end

                
                
            if ( mem_op_pre_indexed || mem_op_post_indexed )
                begin
                
                if ( rn_sel_nxt  == 4'd15 )
                    pc_sel_nxt = 3'd1;
                else
                    reg_bank_wen_nxt = decode ( rn_sel_nxt );
                end

                
            if ( mem_op_post_indexed )
               daddress_sel_nxt = 4'd4; 
            else
               daddress_sel_nxt = 4'd1; 

            if ( instruction[25] && type ==  TRANS )
                barrel_shift_data_sel_nxt = 2'd2; 

            if ( type == TRANS && instruction[25] && shift_imm != 5'd0 )
                begin
                barrel_shift_function_nxt   = instruction[6:5];
                barrel_shift_amount_sel_nxt = 2'd2; 
                end
            end


        if ( type == BRANCH )
            begin
            pc_sel_nxt            = 3'd1; 
            iaddress_sel_nxt      = 4'd1; 
            alu_out_sel_nxt       = 4'd1; 

            if ( instruction[24] ) 
                begin
                reg_bank_wen_nxt  = decode (4'd14);  
                reg_write_sel_nxt = 3'd1;            
                end
            end


        if ( type == MTRANS )
            begin
            saved_current_instruction_wen   = 1'd1; 
            decode_daccess_nxt              = 1'd1; 
            alu_out_sel_nxt                 = 4'd1; 
            base_address_wen_nxt            = 1'd1; 
                                                    

            if ( mtrans_num_registers > 4'd1 )
                begin
                iaddress_sel_nxt        = 4'd3; 
                pc_wen_nxt              = 1'd0; 
                end


            
            
            
            
            restore_base_address_nxt        = instruction[20] &&
                                                (instruction[15:0] & (1'd1 << instruction[19:16]));

            
            if ( instruction[23] )
                begin
                if ( instruction[24] )    
                    daddress_sel_nxt = 4'd7; 
                else
                    daddress_sel_nxt = 4'd4; 
                end
            else
            
                begin
                alu_cin_sel_nxt  = 2'd1; 
                alu_not_sel_nxt  = 1'd1; 
                if ( !instruction[24] )    
                    daddress_sel_nxt  = 4'd6; 
                else
                    daddress_sel_nxt  = 4'd1; 
                end

            
            if ( !instruction[20] )  
                write_data_wen_nxt = 1'd1;

            
            if ( {instruction[22],instruction[20]} == 2'b10 )
                o_user_mode_regs_store_nxt = 1'd1;

            
            if ( instruction[21] )  
                reg_bank_wen_nxt  = decode (rn_sel_nxt);

            
            if ( instruction[20] && mtrans_reg1 == 4'd15 ) 
                begin
                saved_current_instruction_wen   = 1'd1; 
                pc_wen_nxt                      = 1'd0; 
                load_pc_nxt                     = 1'd1;
                end
            end


        if ( type == MULT )
            begin
            multiply_function_nxt[0]        = 1'd1; 
                                                    
            saved_current_instruction_wen   = 1'd1; 
                                                    
            pc_wen_nxt                      = 1'd0; 

            if ( instruction[21] )
                multiply_function_nxt[1]    = 1'd1; 
            end


        
        if ( type == SWAP )
            begin
            saved_current_instruction_wen   = 1'd1; 
            pc_wen_nxt                      = 1'd0; 
            decode_iaccess_nxt              = 1'd0; 
            decode_daccess_nxt              = 1'd1; 
            barrel_shift_data_sel_nxt       = 2'd2; 
            daddress_sel_nxt                = 4'd4; 
            decode_exclusive_nxt            = 1'd1; 
            end


        
        if ( type == CORTRANS && !und_request )
            begin
            saved_current_instruction_wen   = 1'd1; 
            pc_wen_nxt                      = 1'd0; 
            iaddress_sel_nxt                = 4'd3; 

            if ( instruction[20] ) 
                copro_operation_nxt         = 2'd1;  
            else 
                begin
                 
                 
                copro_operation_nxt      = 2'd0;
                copro_write_data_wen_nxt = 1'd1;  
                end
            end


        if ( type == SWI || und_request )
            begin
            
            reg_write_sel_nxt               = 3'd1;            
            reg_bank_wen_nxt                = decode (4'd14);  

            iaddress_sel_nxt                = 4'd2;            
            pc_sel_nxt                      = 3'd2;            

            status_bits_mode_nxt            = interrupt_mode;  
            status_bits_mode_wen_nxt        = 1'd1;

            
            status_bits_irq_mask_nxt        = 1'd1;
            status_bits_irq_mask_wen_nxt    = 1'd1;
            end


        if ( regop_set_flags )
            begin
            status_bits_flags_wen_nxt = 1'd1;

            
            
            if ( instruction[15:12] == 4'd15 )
                begin
                status_bits_sel_nxt       = 3'd1; 

                
                if ( i_execute_status_bits[1:0] != USR )
                    begin
                    status_bits_mode_wen_nxt      = 1'd1;
                    status_bits_irq_mask_wen_nxt  = 1'd1;
                    status_bits_firq_mask_wen_nxt = 1'd1;
                    end
                end
            end

        end