always @(posedge clock or posedge reset)
	if (reset) begin
		data_out_d1 <= {(BITS_PER_SYMBOL * SYMBOLS_PER_BEAT){1'b0}};
		sop_out_d1 <= 1'b0;
		eop_out_d1 <= 1'b0;
	end
	else begin
		data_out_d1 <= data_out;
		sop_out_d1 <= sop_out;
		eop_out_d1 <= eop_out;
	end