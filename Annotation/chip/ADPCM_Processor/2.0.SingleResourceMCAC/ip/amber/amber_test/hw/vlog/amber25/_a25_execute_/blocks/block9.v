always @( posedge reset, posedge clk ) begin
	if (reset) begin
		o_daddress              <= 'd0;
		o_daddress_valid        <= 'd0;
		o_exec_load_rd          <= 'd0;
		o_priviledged           <= 'd0;
		o_exclusive             <= 'd0;
		o_write_enable          <= 'd0;
		o_write_data            <= 'd0;
		o_byte_enable           <= 'd0;
		iaddress_r              <= 32'hdead_dead;
		o_iaddress_valid        <= 'd0;
		o_adex                  <= 'd0;
		o_copro_write_data      <= 'd0;
		base_address            <= 'd0;
		status_bits_flags       <= 'd0;
		status_bits_mode        <= SVC;
		status_bits_mode_rds_oh <= 1'd1 << OH_SVC;
		status_bits_irq_mask    <= 1'd1;
		status_bits_firq_mask   <= 1'd1;
	end else begin
		o_daddress              <= daddress_update                ? o_daddress_nxt               : o_daddress;
		o_daddress_valid        <= daddress_update                ? daddress_valid_nxt           : o_daddress_valid;
		o_exec_load_rd          <= exec_load_rd_update            ? exec_load_rd_nxt             : o_exec_load_rd;
		o_priviledged           <= priviledged_update             ? priviledged_nxt              : o_priviledged;
		o_exclusive             <= exclusive_update               ? i_decode_exclusive           : o_exclusive;
		o_write_enable          <= write_enable_update            ? write_enable_nxt             : o_write_enable;
		o_write_data            <= write_data_update              ? write_data_nxt               : o_write_data;
		o_byte_enable           <= byte_enable_update             ? byte_enable_nxt              : o_byte_enable;
		iaddress_r              <= iaddress_update                ? o_iaddress_nxt               : iaddress_r;
		o_iaddress_valid        <= iaddress_update                ? iaddress_valid_nxt           : o_iaddress_valid;
		o_adex                  <= iaddress_update                ? adex_nxt                     : o_adex;
		o_copro_write_data      <= copro_write_data_update        ? write_data_nxt               : o_copro_write_data;

		base_address            <= base_address_update            ? rn                           : base_address;

		status_bits_flags       <= status_bits_flags_update       ? status_bits_flags_nxt        : status_bits_flags;
		status_bits_mode        <= status_bits_mode_update        ? status_bits_mode_nxt         : status_bits_mode;
		status_bits_mode_rds_oh <= status_bits_mode_rds_oh_update ? status_bits_mode_rds_oh_nxt  : status_bits_mode_rds_oh;
		status_bits_irq_mask    <= status_bits_irq_mask_update    ? status_bits_irq_mask_nxt     : status_bits_irq_mask;
		status_bits_firq_mask   <= status_bits_firq_mask_update   ? status_bits_firq_mask_nxt    : status_bits_firq_mask;
	end
end