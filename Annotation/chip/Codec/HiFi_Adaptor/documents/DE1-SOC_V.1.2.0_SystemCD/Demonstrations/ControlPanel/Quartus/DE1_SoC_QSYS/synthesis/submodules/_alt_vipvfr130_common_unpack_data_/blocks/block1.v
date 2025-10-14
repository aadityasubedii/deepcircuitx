always @(posedge clock or posedge reset)
	if (reset) begin
		write <= 1'b0;
	end
	else if (~stall_out) begin
		write <= ena;
	end
		
endmodule