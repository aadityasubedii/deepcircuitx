	always@(posedge Sclk)
	begin
	  if(adder_en)
	   begin
		if(add_sub == 1'b1)
           temp=b - a;
		else
            temp=b + a;
	   end
	   else
	    temp = temp;
    end