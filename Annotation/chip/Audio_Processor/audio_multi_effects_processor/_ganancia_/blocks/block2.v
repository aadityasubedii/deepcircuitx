always@(posedge clock) begin
if(clockenable) begin
	if(bloque==0) begin
		bloque<=1;
		ampcs<=0;
	end
	else if (bloque==9) begin
		bloque<=0;
		estadosck<=0;
		ampcs<=1;
	end
	else begin
		bloque<=bloque+1;
		estadosck<=1;
	end
end
end