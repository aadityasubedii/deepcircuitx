	always @( posedge reset, posedge clk ) begin
		if (reset) begin
			jitter_r <= 8'h0f;
		end else begin
			jitter_r <= {jitter_r[6:0], jitter_r[7] ^ jitter_r[4] ^ jitter_r[1]};
		end
	end