always @(posedge reset, posedge clk) begin
	if (reset) begin
		ack_owed_r <= 'd0;
	end else begin
	    if (push && in_wreq && !o_ack)
		  ack_owed_r = 1'd1;
	    else if (!i_req && o_ack)
		  ack_owed_r = 1'd0;
	end
end