assign daddress_update                 = !i_core_stall;
assign exec_load_rd_update             = !i_core_stall && execute;
assign priviledged_update              = !i_core_stall;
assign exclusive_update                = !i_core_stall && execute;
assign write_enable_update             = !i_core_stall;
assign write_data_update               = !i_core_stall && execute && i_write_data_wen;
assign byte_enable_update              = !i_core_stall && execute && i_write_data_wen;

assign iaddress_update                 = pc_dmem_wen || (!i_core_stall && !i_conflict);