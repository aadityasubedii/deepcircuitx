always @(posedge clk)
begin
	if (reset == 1'b1)
		counting <= 1'b0;
	else if (reset_bit_counter == 1'b1)
		counting <= 1'b1;
	else if ((bit_clk_falling_edge == 1'b1) && (bit_counter == 5'h00))
		counting <= 1'b0;
end