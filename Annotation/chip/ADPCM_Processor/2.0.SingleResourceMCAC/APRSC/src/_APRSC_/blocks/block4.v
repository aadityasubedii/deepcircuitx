always @(posedge CoPrclk_int, posedge reset) begin
	if(reset) begin
		pulseDelay1 	<= 1'b0;
		pulseDelay	<= 1'b0;
	end
	else if(a2p_read) begin
		pulseDelay1	<= 1'b1;
		pulseDelay	<= pulseDelay1;
	end
	else begin
		pulseDelay1	<= 1'b0;
		pulseDelay	<= pulseDelay1;
	end
end