always @ (posedge Sclk or posedge Start)
begin
	if(Start)
	begin
		data = 40'h0000000000;
		data_out = 1'b0;
		ybt = 6'h00;
		word_sent = 1'b0;
	end
	else 
	begin
		if(en)
		begin
			data = data_in;
			data_out = data[ybt];
			ybt = ybt + 1'b1;
			if(ybt == 6'h28)
			begin
				word_sent = 1'b1;
				ybt = 6'h00;
			end
		end
		else
		begin
			word_sent = 1'b0;
		end
	end
end	