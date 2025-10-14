always@(negedge clock) begin
	if(bloque!=0 & bloque!=9) begin
		mosi<=gain[bloque-1];
	end
	else mosi<=0;
end