always @ (negedge Dclk or posedge rst or posedge received or negedge Reset)
begin
	if( Reset == 1'b0 )
	begin
		bt         <= 4'h0;
		data_out   <= 16'h0000;
		word_ready <= 1'b0;
	end
	else if( rst )
	begin
		bt         <= 4'h0;
		data_out   <= 16'h0000;
		word_ready <= 1'b0;
	end
	else if(received == 1'b1)
	begin
		if(word_ready== 1'b1)
		begin
			word_ready <= 1'b0;
		end
	end
	else
	begin
		if (Frame_edg == 1'b1)
		begin
			if (bt == 4'h0)
			begin
				word_ready <= 1'b0;
			end
			data_out [bt]   <= data_in;
			{word_ready,bt} <= bt + 1'b1;
		end
		
		else
		begin
			word_ready <= 1'b0;
			bt 		   <= 4'h0;
		end
	end
end