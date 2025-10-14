			always @(posedge clk)
			begin
				if (rst)
					cur_add <= 10'd150;
				else
				begin
					case(glyph)
					'd0: begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd1: begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd2:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd3:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd4:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd5:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd6:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd7:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd8:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd9:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd10:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd11:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd12:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd13:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd14:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd15:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd11)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd12)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd13)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd14)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd15)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
						end
					'd16:begin
								if (vcnt == 'd0) 
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd1)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd2)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd3)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd4)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd5)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd6)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd7)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd8)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd9)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};
								else if (vcnt == 'd10)
									cur_add <= 10'd150 + ({glyph, 4'b0000}) + {4'b0000, vcnt};