always@(posedge clock) begin 
if(clockenable) begin 


		bloque<=1;
		estadoadconv<=1;
	end
	else if(bloque==34) begin
		bloque<=0;
	end
	else begin
		bloque<=bloque+1;
		estadoadconv<=0;
	end 
end