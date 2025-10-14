a25_register_bank u_register_bank(
    .clk            ( clk                     ),
    .reset          ( reset                   ),
    .scan_enable    ( scan_enable             ),
    .test_mode      ( test_mode               ),

    .i_core_stall            ( i_core_stall              ),
    .i_mem_stall             ( i_mem_stall               ),
    .i_rm_sel                ( i_rm_sel                  ),
    .i_rs_sel                ( i_rs_sel                  ),
    .i_rn_sel                ( i_rn_sel                  ),
    .i_pc_wen                ( pc_wen                    ),
    .i_reg_bank_wen          ( reg_bank_wen              ),
    .i_pc                    ( pc_nxt[25:2]              ),
    .i_reg                   ( reg_write_nxt             ),
    .i_mode_idec             ( i_status_bits_mode        ),
    .i_mode_exec             ( status_bits_mode          ),

    .i_wb_read_data          ( read_data_filtered        ),
    .i_wb_read_data_valid    ( i_wb_read_data_valid      ),
    .i_wb_read_data_rd       ( i_wb_load_rd[3:0]         ),
    .i_wb_mode               ( i_wb_load_rd[6:5]         ),

    .i_status_bits_flags     ( status_bits_flags         ),
    .i_status_bits_irq_mask  ( status_bits_irq_mask      ),
    .i_status_bits_firq_mask ( status_bits_firq_mask     ),

    
    .i_firq_not_user_mode    ( i_firq_not_user_mode      ),

    
    .i_mode_rds_exec         ( status_bits_mode_rds_oh   ),

    .o_rm                    ( reg_bank_rm               ),
    .o_rs                    ( reg_bank_rs               ),
    .o_rd                    ( reg_bank_rd               ),
    .o_rn                    ( reg_bank_rn               ),
    .o_pc                    ( pc                        )
);