always @(Frame)
begin
	case (state)
	
	2:
	begin
		coeff_status=0;
		in_status=0;
		clear=0;
		rj_status=0;
		
		if(S2P_status==0)
		begin
			rj_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			rj_status=1;
			address_rj = address_rj + 1;
			if(address_rj==15)
				state=3;
		end
	end
	
	4:
	begin
		if(S2P_status==0)
		begin
			coeff_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			coeff_status=1;
			address_coeff = address_coeff + 1;
			if(address_coeff==511)
				state=5;
		end
	end
	
	6:
	begin
		if(S2P_status==0)
		begin
			in_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			in_status=1;
			alu_status=1;
			address_in = address_in + 1;
			cont_address=cont_address+1;
			
			if(cont_address<7000)
			begin
				if(address_in==512)
				begin
					set=set+512;				
					address_in=0;
				end
			end
			else
			begin
				if(address_in==512)
					state=9;
			end
			
		end
	end
	
	endcase
end