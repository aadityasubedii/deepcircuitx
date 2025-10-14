always @(posedge Sclk)
	begin
	  if(write_enable == 1'b1)
	    datamem[datawrite] = in_data;
	  else
	    datamem[datawrite] = datamem[datawrite];
	end