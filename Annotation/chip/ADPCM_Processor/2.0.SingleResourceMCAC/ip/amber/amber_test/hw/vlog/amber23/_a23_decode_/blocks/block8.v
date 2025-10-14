always @ ( posedge i_clk )
    if (!i_fetch_stall)
        begin
        o_read_data                 <= i_read_data;
        o_read_data_alignment       <= {i_execute_address[1:0], 3'd0};
        abt_address_reg             <= i_execute_address;
        iabt_reg                    <= i_iabt;
        adex_reg                    <= i_adex;
        abt_status_reg              <= i_abt_status;
        status_bits_mode_r          <= status_bits_mode_nxt;
        status_bits_irq_mask_r      <= status_bits_irq_mask_nxt;
        status_bits_firq_mask_r     <= status_bits_firq_mask_nxt;
        o_imm32                     <= imm32_nxt;
        o_imm_shift_amount          <= imm_shift_amount_nxt;
        o_shift_imm_zero            <= shift_imm_zero_nxt;

                                        
                                        
                                        
                                        
                                        
        condition_r                 <= instruction_valid && !interrupt ? condition_nxt : AL;
        o_exclusive_exec            <= exclusive_exec_nxt;
        o_data_access_exec          <= data_access_exec_nxt;

        o_rm_sel                    <= o_rm_sel_nxt;
        o_rds_sel                   <= o_rds_sel_nxt;
        o_rn_sel                    <= o_rn_sel_nxt;
        o_barrel_shift_amount_sel   <= barrel_shift_amount_sel_nxt;
        o_barrel_shift_data_sel     <= barrel_shift_data_sel_nxt;
        o_barrel_shift_function     <= barrel_shift_function_nxt;
        o_alu_function              <= alu_function_nxt;
        o_use_carry_in              <= use_carry_in_nxt;
        o_multiply_function         <= multiply_function_nxt;
        o_interrupt_vector_sel      <= next_interrupt;
        address_sel_r               <= address_sel_nxt;
        pc_sel_r                    <= pc_sel_nxt;
        o_byte_enable_sel           <= byte_enable_sel_nxt;
        o_status_bits_sel           <= status_bits_sel_nxt;
        o_reg_write_sel             <= reg_write_sel_nxt;
        o_user_mode_regs_load       <= user_mode_regs_load_nxt;
        o_firq_not_user_mode        <= firq_not_user_mode_nxt;
        o_write_data_wen            <= write_data_wen_nxt;
        o_base_address_wen          <= base_address_wen_nxt;
        pc_wen_r                    <= pc_wen_nxt;
        o_reg_bank_wsel             <= reg_bank_wsel_nxt;
        o_reg_bank_wen              <= decode ( reg_bank_wsel_nxt );
        o_status_bits_flags_wen     <= status_bits_flags_wen_nxt;
        o_status_bits_mode_wen      <= status_bits_mode_wen_nxt;
        o_status_bits_irq_mask_wen  <= status_bits_irq_mask_wen_nxt;
        o_status_bits_firq_mask_wen <= status_bits_firq_mask_wen_nxt;

        o_copro_opcode1             <= instruction[23:21];
        o_copro_opcode2             <= instruction[7:5];
        o_copro_crn                 <= instruction[19:16];
        o_copro_crm                 <= instruction[3:0];
        o_copro_num                 <= instruction[11:8];
        o_copro_operation           <= copro_operation_nxt;
        o_copro_write_data_wen      <= copro_write_data_wen_nxt;
        mtrans_r15                  <= mtrans_r15_nxt;
        restore_base_address        <= restore_base_address_nxt;
        control_state               <= control_state_nxt;
        mtrans_reg_d1               <= mtrans_reg;
        mtrans_reg_d2               <= mtrans_reg_d1;
        end