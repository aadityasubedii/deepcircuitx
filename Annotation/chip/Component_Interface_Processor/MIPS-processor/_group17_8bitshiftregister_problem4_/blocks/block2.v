always @(clk)     
	begin
		if(enb==1'b1)
			begin
				if(c1==1'b0 && c0==1'b0)
				begin

				end
				
				else if(c1==1'b0 && c0==1'b1)
				begin
					tempo1=sri;
					tempo2=in[3];
					tempo3=in[2];
					tempo4=in[1];
				end
				
				else if(c1==1'b1 && c0==1'b0) 
				begin
					tempo1=in[2];
					tempo2=in[1];
					tempo3=in[0];
					tempo4=sli;
				end
				
				else 
				begin
					tempo1=in[3];
					tempo2=in[2];
					tempo3=in[1];
					tempo4=in[0];
				end
				
			end
	
	end