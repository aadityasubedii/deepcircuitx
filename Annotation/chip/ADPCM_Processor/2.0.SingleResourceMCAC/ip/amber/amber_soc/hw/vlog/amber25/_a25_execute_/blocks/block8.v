
assign base_address_update             = !i_core_stall && execute && i_base_address_wen;
assign status_bits_flags_update        = ldm_flags       || (!i_core_stall && execute && i_status_bits_flags_wen);
assign status_bits_mode_update         = ldm_status_bits || (!i_core_stall && execute && i_status_bits_mode_wen);
assign status_bits_mode_rds_oh_update  = !i_core_stall;
assign status_bits_irq_mask_update     = ldm_status_bits || (!i_core_stall && execute && i_status_bits_irq_mask_wen);
assign status_bits_firq_mask_update    = ldm_status_bits || (!i_core_stall && execute && i_status_bits_firq_mask_wen);