always @(posedge negCoPrclk_int or posedge reset) begin
	if(reset) begin
		MACstart	<=	1'b0;
		se		<=	15'h0000;
		sez		<=	15'h0000;
		a2p		<=	16'h0000;
		state		<=	2'b00;
		sr_out		<=	16'h0000;
	end
	else begin
		case(state)
			2'b00: begin
				se     <= se;
				sez    <= sez;
				a2p    <= a2p;
				sr_out <= sr_out;

				if(req2) begin
					state    <= 2'b01;
					MACstart <= 1'b1;
				end
				else begin
					state    <= 2'b00;
					MACstart <= 1'b0;
				end
			end
			2'b01: begin
				if(!MACdone) begin
					state    <= 2'b01;
					se       <= se;
					sez      <= sez;
					a2p      <= a2p;
					sr_out   <= sr_out;
					MACstart <= 1'b1;
				end
				else begin
					state    <= 2'b10;
					MACstart <= 1'b0;
					se       <= se_int;
					sez      <= sez_int;
					a2p      <= a2p_int;
					sr_out   <= sr_int;
				end
			end
			2'b10: begin
				MACstart <= 1'b0;
				se       <= se;
				sez      <= sez;
				a2p      <= a2p;
				sr_out   <= sr_out;
				if(!req2) begin
					state <= 2'b00;
				end
				else begin
					state <= 2'b10;
				end
			end
			default: begin
				state    <= 2'b00;
				MACstart <= 1'b0;
				se       <= se;
				sez      <= sez;
				a2p      <= a2p;
				sr_out   <= sr_out;
			end
		endcase
	end
end 