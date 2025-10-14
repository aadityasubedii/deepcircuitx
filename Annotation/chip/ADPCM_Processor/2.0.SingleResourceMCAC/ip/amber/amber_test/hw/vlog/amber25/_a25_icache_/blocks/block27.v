	always @ ( posedge reset, posedge clk ) begin
		if (reset) begin
			valid_bits_r <= 'd0;
		end else if ( c_state == CS_IDLE ) begin
			valid_bits_r <= {tag_rdata_way[2][TAG_WIDTH-1], 
					     tag_rdata_way[1][TAG_WIDTH-1], 
					     tag_rdata_way[0][TAG_WIDTH-1]};
		end
	end