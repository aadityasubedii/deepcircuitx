	always @(negedge Sclk)
	begin
		if (outL)
		begin
			p2sL_en = 1'b1;
			rjL_addr = 4'd0;
			coeffL_addr = 9'd0;
			kL = 8'd0;
			outL = 1'b0;
			clearL = 1'b1;
		end
		else
			p2sL_en = 1'b0;
		
		if (start_workL == 1'b1)
		begin
			outL = 1'b0;
			rjL_addr = 4'd0;
			rjL_enable = 1'b1;
			coeffL_addr = 9'd0;
			coeffL_enable = 1'b1;
			inputL_enable = 1'b0;
			adderL_en = 1'b0;
			shiftL_en = 1'b0;
			kL = 8'd0;
			clearL = 1'b1;
			loadL = 1'b0;
		end
		else if (work_statusL == 1'b1)
		begin
			if (kL == rjdataL)
			begin
				inputL_enable = 1'b0;
				shiftL_en = 1'b1;
				clearL = 1'b0;
				loadL = 1'b1;
				adderL_en = 1'b1;
				kL = 8'd0;
				if (rjL_addr < 4'd15)
				begin
					rjL_addr = rjL_addr + 1'b1;
				end
				else
				begin
					rjL_addr = 4'd0;
					outL = 1'b1;
					coeffL_addr = 9'd0;
				end
			end
			else
			begin
				shiftL_en = 1'b0;
				clearL = 1'b0;
				loadL = 1'b0;
				inputL_enable = 1'b0;
				x_indexL = coeffdataL[7:0];
				addsubL = coeffdataL[8];
				if (xcntL - 1'b1 >= x_indexL)
				begin
					inputL_addr = xcntL - 1'b1 - x_indexL;
					inputL_enable = 1'b1;
					adderL_en = 1'b1;
					loadL = 1'b1;
				end
				else if (xcntL - 1'b1 < x_indexL && memL_overflow == 1'b1)
				begin
					inputL_addr = xcntL - 1'b1 + (9'd256 - x_indexL);
					inputL_enable = 1'b1;
					adderL_en = 1'b1;
					loadL = 1'b1;
				end
				else
				begin
					inputL_addr = inputL_addr;
					adderL_en = 1'b0;
				end
				
				if (coeffL_addr < 9'h1FF)
					coeffL_addr = coeffL_addr + 1'b1;
				else
					coeffL_addr = coeffL_addr;
				
				kL = kL + 1'b1;
			end
		end
		else
		begin
			rjL_addr = 4'd0;
			rjL_enable = 1'b0;
			coeffL_addr = 9'd0;
			coeffL_enable = 1'b0;
			inputL_enable = 1'b0;
			adderL_en = 1'b0;
			shiftL_en = 1'b0;
			kL = 8'd0;
			loadL = 1'b0;
			clearL = 1'b1;
		end
	end