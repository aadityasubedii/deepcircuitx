initial begin
	record <= 0;
	play <= 0;
	delete <= 0;
	delete_all <= 0;
	pause <= 0;
	count <= 0;
	volume_control <= 1;
	playback <= 0;
	address <= 0;
	
	
	state <= 8'h00;
	
	
	STATLED2 <= 0;
	
	
	enableWrite <= 0;
	LEDRAM <= 1'b0;
end