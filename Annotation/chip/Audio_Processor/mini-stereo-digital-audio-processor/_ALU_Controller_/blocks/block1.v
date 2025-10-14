always @(posedge Sclk)
begin
	
	if(alu_status == 1)
	begin
		case (flagR)	
		
		1:
		begin
			if(ir<16)
			begin
				R = read_rjr;
				kR = read_coeffr[7:0];
				signbitR = read_coeffr[8];
				if(jR<(pR+R))
				begin

					add_statusR=0;
					flagR=2;
					if(cont_address >= kR)
					begin
						sign_statusR=1;
						index_inR=cont_address-kR;
						if(index_inR > 511)
						begin
							index_inR = index_inR  - set;
							if(index_inR < 0)
							begin
								index_inR = index_inR + 512;
							end
						end
					end
				end				
			end
		end
		
		2:
		begin
			if(cont_address >= kR)
			begin
				if(signbitR == 1'b1)
				begin
					addorsubR=1;
					addip1R=ur;
					flagR = 3;
				end
				else
				begin
					addorsubR=0;
					addip1R=ur;
					flagR = 3;
				end
			end
			else 
			begin
			jR=jR+1;
			if(jR==(pR+R))
			begin
				addorsubR=0;
				addip1R=yr;
				addip2R=ur;
				flagR=5;
			end
			else 
				flagR=1;
				index_coeffR=jR;
			end
		end
		
		3:
		begin
		addip2R=signoutR;
		flagR=4;
		end
				
		4:
		begin
			ur=addopR;
			addorsubR=0;
			jR=jR+1;
			if(jR==(pR+R))
			begin
				addorsubR=0;
				addip1R=yr;
				addip2R=ur;
				flagR=5;
			end
			else 
				flagR=1;
				index_coeffR=jR;
		end
		
		5:
		begin
			shift_statusR=1;
			shiftipR=addopR;
			flagR=6;
		end
	
		6:
		begin
			yr=shiftopR;
			if(jR==(pR+R))
			begin
				flagR=1;
				pR = pR+R;
				ir=ir+1;
				index_rjR=ir;
				jR = pR;
				index_coeffR=jR;
				
				ur = 40'b0;
				R = read_rjr;				
				sign_statusR=0;
			end
			if(ir==16)
				flagR=7;
		end
		
		7:
		begin
			OutputdataR = yr;
			P2S_status=1;
		end
		
		endcase
	end
	
end