always @ (posedge Sclk or negedge Reset or posedge Start or posedge valid)
begin
	if(Reset == 1'b0)
	begin
		RJ_en = 1'b0;
		rr_ptr = 4'h0;
		rj_data = 16'h0000;
		rj_read = 1'b0;
		
		H_en = 1'b0;
		hr_ptr = 9'h000;
		h_cntr = 8'h00;
		h_data = 16'h0000;
		h_read = 1'b0;
		calc = 1'b0;
		h_finish = 1'b0;
		last_h = 1'b0;
		
		X_rd_en = 1'b0;
		xr_ptr = 8'h00;
		x_read = 1'b0;
		x_data = 16'h0000;
		x_finish = 1'b0;
		last_x = 1'b0;
		
		U = 40'h0000000000;
		U_curr = 40'h0000000000;
		y = 40'h0000000000;
		neg = 2'h0;
		prev_OutReady = 1'b0;
	end
	else if(Start== 1'b1)
	begin
		RJ_en = 1'b0;
		rr_ptr = 4'h0;
		rj_data = 16'h0000;
		rj_read = 1'b0;
		
		H_en = 1'b0;
		hr_ptr = 9'h000;
		h_cntr = 8'h00;
		h_data = 16'h0000;
		h_read = 1'b0;
		calc = 1'b0;
		h_finish = 1'b0;
		last_h = 1'b0;
		
		X_rd_en = 1'b0;
		xr_ptr = 8'h00;
		x_read = 1'b0;
		x_data = 16'h0000;
		x_finish = 1'b0;
		last_x = 1'b0;
		
		U = 40'h0000000000;
		U_curr = 40'h0000000000;
		y = 40'h0000000000;
		neg = 2'h0;
		prev_OutReady = 1'b0;
	end
	else if(valid== 1'b1)
	begin
	    RJ_en = 1'b0;
		H_en = 1'b0;
		X_rd_en = 1'b0; 
	end
	
	else
	begin
		if(en== 1'b1)
		begin
			prev_OutReady = 1'b0;
			if(sleep== 1'b0)
			begin
				if(x_read== 1'b1)
				begin
					if(neg[1]== 1'b0)
					begin
						x_data = x_data_in;
					end
					else
					begin
						x_data = 16'h0000; 
					end
					x_read = 1'b0;
					
					if ( h_sign== 1'b0 )
					begin
						U = U + {{8{x_data[15]}},x_data,{16{1'b0}}};
						U_curr = U_curr + {{8{x_data[15]}},x_data,{16{1'b0}}};
					end
					
					else
					begin
						U = U - {{8{x_data[15]}},x_data,{16{1'b0}}};
						U_curr = U_curr - {{8{x_data[15]}},x_data,{16{1'b0}}};
					end
				end
			
				if(x_finish== 1'b1)
				begin
					
					
					U = {U[39],U[39:1]};
					U_curr = {40{1'b0}};
					if(last_x == 1'b1)
					begin
						last_x = 1'b0;
						y = U;
						
						
						prev_OutReady = 1'b1;
						calc = 1'b0;
					end
					x_finish = 1'b0;
				end
		
				if(h_finish== 1'b1)
				begin
					x_finish = 1'b1;
					if(last_h== 1'b1)
					begin
						last_x = 1'b1;
					end
					h_finish = 1'b0;
				end
			
				if(h_read== 1'b1)
				begin
					h_data = h_data_in;
					
					h_read = 1'b0;
					calc = 1'b1;
				end
			
				if(calc== 1'b1)
				begin
					{neg,xr_ptr} = {x_flagbit, n} - h_data[7:0];
					if( neg[1]== 1'b0 )
					begin
						X_rd_en = 1'b1;
						
					end
					h_sign = h_data[8];
					x_read = 1'b1;
				end
			
				if(rj_read== 1'b1)
				begin
					rj_data = rj_data_in;
					rj_read = 1'b0;
				end
				
				if(h_cntr != rj_data)
				begin
					hr_ptr = hr_ptr_buff;
					H_en = 1'b1;
					h_read = 1'b1;
					h_cntr = h_cntr + 1'b1;
				end
	
				if(((h_cntr == rj_data) || (rr_ptr_buff == 4'h0)) && (last_h == 1'b0))
				begin
					if(rr_ptr == 4'hf)
					begin
						last_h = 1'b1;
						h_finish = 1'b1;
						rr_ptr = rr_ptr_buff;
					end
					else
					begin
						rr_ptr = rr_ptr_buff;
						if(rr_ptr != 1'b0)  
						begin
							h_finish = 1'b1;
						end
						h_cntr = 8'h00;
						RJ_en = 1'b1;
						rj_read = 1'b1;
					end
				end
			end
		end
		
		else
		begin
			RJ_en = 1'b0;
			rr_ptr = 4'h0;
			rj_data = 16'h0000;
			rj_read = 1'b0;
			
			H_en = 1'b0;
			hr_ptr = 9'h000;
			h_cntr = 8'h00;
			h_data = 16'h0000;
			h_read = 1'b0;
			calc = 1'b0;
			h_finish = 1'b0;
			last_h = 1'b0;
			
			X_rd_en = 1'b0;
			x_read = 1'b0;
			x_data = 16'h0000;
			x_finish = 1'b0;
			last_x = 1'b0;
			
			U = 40'h0000000000;
			U_curr = 40'h0000000000;
			neg = 2'h0;
		end
	end
end