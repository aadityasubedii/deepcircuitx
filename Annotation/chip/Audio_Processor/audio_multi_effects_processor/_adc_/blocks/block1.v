always@(negedge clock) begin
	if(bloque>=4 & bloque<=15) datostemp[bloque-4]<=miso;
	else if(bloque==16) datos<=datostemp;
	else if(bloque==34) ready<=1;
	else if(bloque==0) begin 
		ready<=0;
		estadosck<=0;
	end
	else if(bloque==1) estadosck<=1;



end