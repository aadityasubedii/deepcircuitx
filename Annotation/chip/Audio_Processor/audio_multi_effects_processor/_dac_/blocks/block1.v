always@(negedge clock) begin
	if(bloque>=9 & bloque<=12) mosi<=command[bloque-9];
	else if(bloque>=13 & bloque<=16) mosi<=address[bloque-13];
	else if(bloque>=17 & bloque<=28) mosi<=datos2compl[bloque-17];	
	else mosi<=0;
end