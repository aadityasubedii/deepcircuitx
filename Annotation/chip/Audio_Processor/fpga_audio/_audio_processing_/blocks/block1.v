always @(posedge clk)begin
	case(state)
		ST_IDLE : begin
			
		end
		ST_CLIP_L : begin
			if(ch1_in > $signed(16'h1FFF))begin
				ch1_buf <= 16'h1FFF;
			end
			else if(ch1_in < $signed(16'hE000))begin
				ch1_buf <= 16'hE000;
			end
			else begin
				ch1_buf <= ch1_in;
			end
			state <= ST_CLIP_R;
		end
		ST_CLIP_R : begin
			if(ch2_in > $signed(16'h1FFF))begin
				ch2_buf <= 16'h1FFF;
			end
			else if(ch2_in < $signed(16'hE000))begin
				ch2_buf <= 16'hE000;
			end
			else begin
				ch2_buf <= ch2_in;
			end
			state <= ST_IDLE;
		end
	endcase
end