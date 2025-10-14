assign r15_out_rm     = { i_status_bits_flags, 
                          i_status_bits_irq_mask, 
                          i_status_bits_firq_mask, 
                          r15, 
                          i_mode_exec};

assign r15_out_rm_nxt = { i_status_bits_flags, 
                          i_status_bits_irq_mask, 
                          i_status_bits_firq_mask, 
                          i_pc, 
                          i_mode_exec};
                      
assign r15_out_rn     = {6'd0, r15, 2'd0};

