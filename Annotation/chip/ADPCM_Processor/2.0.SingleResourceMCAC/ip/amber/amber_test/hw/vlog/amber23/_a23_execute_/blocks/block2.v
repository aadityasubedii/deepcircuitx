`ifndef A23_RAM_REGISTER_BANK
a23_register_bank u_register_bank(
    .i_clk                   ( i_clk                     ),
    .i_fetch_stall           ( i_fetch_stall             ),
    .i_rm_sel                ( i_rm_sel                  ),
    .i_rds_sel               ( i_rds_sel                 ),
    .i_rn_sel                ( i_rn_sel                  ),
    .i_pc_wen                ( pc_wen                    ),
    .i_reg_bank_wen          ( reg_bank_wen              ),
    .i_pc                    ( pc_nxt[25:2]              ),
    .i_reg                   ( reg_write_nxt             ),
    .i_mode_idec             ( i_status_bits_mode        ),
    .i_mode_exec             ( status_bits_mode          ),

    .i_status_bits_flags     ( status_bits_flags         ),
    .i_status_bits_irq_mask  ( status_bits_irq_mask      ),
    .i_status_bits_firq_mask ( status_bits_firq_mask     ),

    
    .i_firq_not_user_mode    ( i_firq_not_user_mode      ),
    
    
    .i_mode_rds_exec         ( status_bits_mode_rds_oh   ),  
    
    .i_user_mode_regs_load   ( i_user_mode_regs_load     ),
    .o_rm                    ( rm                        ),
    .o_rs                    ( rs                        ),
    .o_rd                    ( rd                        ),
    .o_rn                    ( rn                        ),
    .o_pc                    ( pc                        )
);
`else
a23_ram_register_bank u_register_bank(
    .i_clk                   ( i_clk                     ),
    .i_fetch_stall           ( i_fetch_stall             ),
    .i_rm_sel                ( i_rm_sel_nxt              ),
    .i_rds_sel               ( i_rds_sel_nxt             ),
    .i_rn_sel                ( i_rn_sel_nxt              ),
    .i_pc_wen                ( pc_wen                    ),
    .i_reg_bank_wsel         ( reg_bank_wsel             ),
    .i_pc                    ( pc_nxt[25:2]              ),
    .i_reg                   ( reg_write_nxt             ),

    .i_mode_exec_nxt         ( status_bits_mode_nr       ),
    .i_mode_exec             ( status_bits_mode          ),
    .i_mode_rds_exec         ( status_bits_mode_rds_nr   ),
    .i_user_mode_regs_load   ( i_user_mode_regs_load     ),

    .i_status_bits_flags     ( status_bits_flags         ),
    .i_status_bits_irq_mask  ( status_bits_irq_mask      ),
    .i_status_bits_firq_mask ( status_bits_firq_mask     ),

    .o_rm                    ( rm                        ),
    .o_rs                    ( rs                        ),
    .o_rd                    ( rd                        ),
    .o_rn                    ( rn                        ),
    .o_pc                    ( pc                        )
);
`endif