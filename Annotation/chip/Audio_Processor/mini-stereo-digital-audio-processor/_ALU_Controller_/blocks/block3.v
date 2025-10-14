always @(posedge Sclk)
begin
	
	if(alu_status == 1)
	begin
		case (flagL)	
		
		1:
		begin
			if(il<16)
			begin
				L = read_rjl;
				kL = read_coeffl[7:0];
				signbitL = read_coeffl[8];
				if(jL<(pL+L))
				begin

					add_statusL=0;
					flagL=2;
					if(cont_address >= kL)
					begin
						sign_statusL=1;
						index_inL=cont_address-kL;
						if(index_inL > 511)
						begin
							index_inL = index_inL  - set;
							if(index_inL < 0)
							begin
								index_inL = index_inL + 512;
							end
						end
					end
				end				
			end
		end
		
		2:
		begin
			if(cont_address >= kL)
			begin
				if(signbitL == 1'b1)
				begin
					addorsubL=1;
					addip1L=ul;
					flagL = 3;
				end
				else
				begin
					addorsubL=0;
					addip1L=ul;
					flagL = 3;
				end
			end
			else 
			begin
			jL=jL+1;
			if(jL==(pL+L))
			begin
				addorsubL=0;
				addip1L=yl;
				addip2L=ul;
				flagL=5;
			end
			else 
				flagL=1;
				index_coeffL=jL;
			end
		end
		
		3:
		begin
		addip2L=signoutL;
		flagL=4;
		end
				
		4:
		begin
			ul=addopL;
			addorsubL=0;
			jL=jL+1;
			if(jL==(pL+L))
			begin
				addorsubL=0;
				addip1L=yl;
				addip2L=ul;
				flagL=5;
			end
			else 
				flagL=1;
				index_coeffL=jL;
		end
		
		5:
		begin
			shift_statusL=1;
			shiftipL=addopL;
			flagL=6;
		end
	
		6:
		begin
			yl=shiftopL;
			if(jL==(pL+L))
			begin
				flagL=1;
				pL = pL+L;
				il=il+1;
				index_rjL=il;
				jL = pL;
				index_coeffL=jL;
				ul = 40'b0;
				
				L = read_rjl;				
				sign_statusL=0;
			end
			if(il==16)
				flagL=7;
		end
		
		7:
		begin
			OutputdataL = yl;
			P2S_status=1;
		end
		
		endcase
	end
	
end