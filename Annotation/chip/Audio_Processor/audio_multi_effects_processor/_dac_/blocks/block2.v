always@(posedge clock) begin
if(clockenable) begin
	if(bloque==0) begin
		bloque<=1;
		daccs<=0;
	end
	
	else if(bloque==33) begin
		bloque<=0;
		daccs<=1;
		estadosck<=0;
	end
	else begin
		bloque<=bloque+1;
		estadosck<=1;
	end
end