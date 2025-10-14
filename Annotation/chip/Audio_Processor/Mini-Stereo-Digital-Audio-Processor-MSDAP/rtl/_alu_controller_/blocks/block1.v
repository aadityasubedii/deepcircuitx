	always @(negedge Sclk)
	begin
		if (outR)
		begin
			p2sR_en = 1'b1;
			rjR_addr = 4'd0;
			coeffR_addr = 9'd0;
			kR = 8'd0;
			outR = 1'b0;
		end
		else
			p2sR_en = 1'b0;
		
		if (start_workR == 1'b1)
		begin
			outR = 1'b0;
			rjR_addr = 4'd0;
			rjR_enable = 1'b1;
			coeffR_addr = 9'd0;
			coeffR_enable = 1'b1;
			inputR_enable = 1'b0;
			adderR_en = 1'b0;
			shiftR_en = 1'b0;
			kR = 8'd0;
			clearR = 1'b1;
			loadR = 1'b0;
		end
		else if (work_statusR == 1'b1)
		begin
			if (kR == rjdataR)
			begin
				inputR_enable = 1'b0;
				shiftR_en = 1'b1;
				clearR = 1'b0;
				loadR = 1'b1;
				adderR_en = 1'b1;
				kR = 8'd0;
				if (rjR_addr < 4'd15)
				begin
					rjR_addr = rjR_addr + 1'b1;
				end
				else
				begin
					rjR_addr = 4'd0;
					outR = 1'b1;
					coeffR_addr = 9'd0;
				end
			end
			else
			begin
				shiftR_en = 1'b0;
				clearR = 1'b0;
				loadR = 1'b0;
				inputR_enable = 1'b0;
				x_indexR = coeffdataR[7:0];
				addsubR = coeffdataR[8];
				if (xcntR - 1'b1 >= x_indexR)
				begin
					inputR_addr = xcntR - 1'b1 - x_indexR;
					inputR_enable = 1'b1;
					adderR_en = 1'b1;
					loadR = 1'b1;
				end
				else if (xcntR - 1'b1 < x_indexR && memR_overflow == 1'b1)
				begin
					inputR_addr = xcntR - 1'b1 + (9'd256 - x_indexR);
					inputR_enable = 1'b1;
					adderR_en = 1'b1;
					loadR = 1'b1;
				end
				else
				begin
					inputR_addr = inputR_addr;
					adderR_en = 1'b0;
				end
				
				if (coeffR_addr < 9'h1FF)
					coeffR_addr = coeffR_addr + 1'b1;
				else
					coeffR_addr = coeffR_addr;
				
				kR = kR + 1'b1;
			end
		end
		else
		begin
			rjR_addr = 4'd0;
			rjR_enable = 1'b0;
			coeffR_addr = 9'd0;
			coeffR_enable = 1'b0;
			inputR_enable = 1'b0;
			adderR_en = 1'b0;
			shiftR_en = 1'b0;
			kR = 8'd0;
			loadR = 1'b0;
			clearR = 1'b1;
		end
	end