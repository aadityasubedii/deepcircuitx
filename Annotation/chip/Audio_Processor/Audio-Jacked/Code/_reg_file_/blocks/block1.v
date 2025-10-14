always@(posedge clk)
	if (reset)	  begin
						RAM[32'd0] = 0;
						RAM[32'd1] = 0;
						RAM[32'd2] = 0;
						RAM[32'd3] = 0;
						RAM[32'd4] = 0;
						RAM[32'd5] = 0;
						RAM[32'd6] = 0;
						RAM[32'd7] = 0;
						RAM[32'd8] = 0;
						RAM[32'd9] = 0;
						RAM[32'd10] = 0;
						RAM[32'd11] = 0;
						RAM[32'd12] = 0;
						RAM[32'd13] = 0;
						RAM[32'd14] = 0;
						RAM[32'd15] = 0;
					 end