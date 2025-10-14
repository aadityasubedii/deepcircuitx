always @( posedge reset, posedge clk ) begin
	if (reset) begin
	
	end else begin
		  if ( 
		       i_pc_sel != 3'd0 && 
		       i_pc_wen &&
		       !i_core_stall && 
		       i_instruction_execute && 
		       i_interrupt == 3'd0 &&
		       !execute_undefined &&
		       itype != SWI &&
		       execute_address != get_32bit_signal(0)  
		       )
		      begin
		      $fwrite(decompile_file,"%09d              jump    from ", `U_TB.clk_count);
		      fwrite_hex_drop_zeros(decompile_file,  pcf(execute_address));
		      $fwrite(decompile_file," to ");
		      fwrite_hex_drop_zeros(decompile_file,  pcf(get_32bit_signal(0)) ); 
		      $fwrite(decompile_file,", r0 %08h, ",  get_reg_val ( 5'd0 ));
		      $fwrite(decompile_file,"r1 %08h\n",    get_reg_val ( 5'd1 ));
		      end
	end
end