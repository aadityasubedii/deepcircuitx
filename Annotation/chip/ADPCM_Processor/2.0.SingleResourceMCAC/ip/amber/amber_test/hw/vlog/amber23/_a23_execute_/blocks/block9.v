always @( posedge i_clk )
    begin                                                                                                             
    o_priviledged           <= priviledged_update             ? priviledged_nxt              : o_priviledged;
    o_exclusive             <= exclusive_update               ? i_exclusive_exec             : o_exclusive;
    o_data_access           <= data_access_update             ? i_data_access_exec           : o_data_access;
    o_write_enable          <= write_enable_update            ? write_enable_nxt             : o_write_enable;
    o_write_data            <= write_data_update              ? write_data_nxt               : o_write_data; 
    address_r               <= address_update                 ? o_address_nxt                : address_r;    
    o_adex                  <= address_update                 ? adex_nxt                     : o_adex;    
    o_address_valid         <= address_update                 ? 1'd1                         : o_address_valid;
    o_byte_enable           <= byte_enable_update             ? byte_enable_nxt              : o_byte_enable;
    o_copro_write_data      <= copro_write_data_update        ? write_data_nxt               : o_copro_write_data; 

    base_address            <= base_address_update            ? rn                           : base_address;    

    status_bits_flags       <= status_bits_flags_update       ? status_bits_flags_nxt        : status_bits_flags;
    status_bits_mode        <=  status_bits_mode_nr;
    status_bits_mode_rds_oh <= status_bits_mode_rds_oh_update ? status_bits_mode_rds_oh_nxt  : status_bits_mode_rds_oh;
    status_bits_mode_rds    <= status_bits_mode_rds_nr;
    status_bits_irq_mask    <= status_bits_irq_mask_update    ? status_bits_irq_mask_nxt     : status_bits_irq_mask;
    status_bits_firq_mask   <= status_bits_firq_mask_update   ? status_bits_firq_mask_nxt    : status_bits_firq_mask;
    end