always @(posedge Sclk)
begin
	if(Start==1)
		state=0;
	
	case (state)
	
	0:
	begin
		InReady=0;
		rj_status=1;
		coeff_status=1;
		in_status=1;
		clear=1;
		state=1;
	end
	
	1:
	begin
		InReady=1;
		if(Frame==1)
		begin
			address_rj=-1;
			state=2;
		end		
	end
	
	3:
	begin
		InReady=1;
		if(Frame==1)
		begin
			address_coeff=-1;
			state=4;
		end		
	end
	
	5:
	begin
		InReady=1;
		if(Frame==1)
		begin
			address_in=-1;
			state=6;
		end
		if(Reset_n==0)
			state=7;
	end
	
	6:
	begin
		
		if(Reset_n==1'b0)
		begin
			state=7;
			InReady=0;
			alu_status=0;
		end	
		
		if(sleep_status==1)
		begin	
			alu_status=0;
			if(col==-1)
			begin			
				state=8;
			end
			
		end
	end
	
	7:
	begin
		InReady = 0;
		if(Reset_n==1'b0)
		begin
			state=7;
			InReady=0;
		end
		else
		begin
			state=5;
			cont_address=set-1;
			InReady = 1;
		end
		alu_status=0;
		in_status=1;
	end
	
	8:
	begin
	
		if(Reset_n==1'b0)
		begin
			state=7;
			InReady=0;
		end
	
		if(S2P_status==0)
		begin
			in_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			if(sleep_status==1)
			begin
				in_status=1;			
			end
			else
			begin
				state=6;
				alu_status=1;
			end
		end
		
	end
	
	
	endcase

end