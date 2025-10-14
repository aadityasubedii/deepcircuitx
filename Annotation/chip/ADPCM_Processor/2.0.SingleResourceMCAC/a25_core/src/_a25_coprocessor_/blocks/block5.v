always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		cache_control <= 3'b000;
		cacheable_area <= 32'h0;
		updateable_area <= 32'h0;
		disruptive_area <= 32'h0;
	end else begin
	    if ( !i_core_stall )         
		  begin
		  if ( i_copro_operation == 2'd2 )
		      case ( i_copro_crn )
		          4'd2: cache_control   <= i_copro_write_data[2:0];
		          4'd3: cacheable_area  <= i_copro_write_data[31:0];
		          4'd4: updateable_area <= i_copro_write_data[31:0];
		          4'd5: disruptive_area <= i_copro_write_data[31:0];
		      endcase
		  end
	end
end