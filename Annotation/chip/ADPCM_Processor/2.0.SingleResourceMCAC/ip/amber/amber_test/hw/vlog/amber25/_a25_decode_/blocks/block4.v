always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		saved_current_instruction              <= 'd0;
		saved_current_instruction_type         <= 'd0;
		saved_current_instruction_iabt         <= 'd0;
		saved_current_instruction_adex         <= 'd0;
		saved_current_instruction_address      <= 'd0;
		saved_current_instruction_iabt_status  <= 'd0;
		pre_fetch_instruction                  <= 'd0;
		pre_fetch_instruction_type             <= 'd0;
		pre_fetch_instruction_iabt             <= 'd0;
		pre_fetch_instruction_adex             <= 'd0;
		pre_fetch_instruction_address          <= 'd0;
		pre_fetch_instruction_iabt_status      <= 'd0;
		hold_instruction              <= 'd0;
		hold_instruction_type         <= 'd0;
		hold_instruction_iabt         <= 'd0;
		hold_instruction_adex         <= 'd0;
		hold_instruction_address      <= 'd0;
		hold_instruction_iabt_status  <= 'd0;
	end else begin
	    if ( !i_core_stall )
		  begin
		  
		  
		  
		  
		  
		  if      ( type == MTRANS )
		      begin
		      saved_current_instruction              <= mtrans_instruction_nxt;
		      saved_current_instruction_type         <= type;
		      saved_current_instruction_iabt         <= instruction_iabt;
		      saved_current_instruction_adex         <= instruction_adex;
		      saved_current_instruction_address      <= instruction_address;
		      saved_current_instruction_iabt_status  <= instruction_iabt_status;
		      end
		  else if ( saved_current_instruction_wen )
		      begin
		      saved_current_instruction              <= instruction;
		      saved_current_instruction_type         <= type;
		      saved_current_instruction_iabt         <= instruction_iabt;
		      saved_current_instruction_adex         <= instruction_adex;
		      saved_current_instruction_address      <= instruction_address;
		      saved_current_instruction_iabt_status  <= instruction_iabt_status;
		      end

		  if      ( pre_fetch_instruction_wen )
		      begin
		      pre_fetch_instruction                  <= fetch_instruction_r;
		      pre_fetch_instruction_type             <= fetch_instruction_type_r;
		      pre_fetch_instruction_iabt             <= iabt_reg;
		      pre_fetch_instruction_adex             <= adex_reg;
		      pre_fetch_instruction_address          <= fetch_address_r;
		      pre_fetch_instruction_iabt_status      <= abt_status_reg;
		      end


		  
		  hold_instruction              <= instruction;
		  hold_instruction_type         <= type;
		  hold_instruction_iabt         <= instruction_iabt;
		  hold_instruction_adex         <= instruction_adex;
		  hold_instruction_address      <= instruction_address;
		  hold_instruction_iabt_status  <= instruction_iabt_status;
		  end
	end
end