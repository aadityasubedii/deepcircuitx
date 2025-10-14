always @ (posedge clk) begin
	case (PS) 
		IDLE:   begin
			NS <= CHAN_0;
		end
		CHAN_0:  begin
			NS <= (shift_count_0 == 15) ? CHAN_1 : CHAN_0;
		end
		CHAN_1: begin
			NS <= (shift_count_1 == 15) ? CHAN_0 : CHAN_1;
		end
	endcase
end