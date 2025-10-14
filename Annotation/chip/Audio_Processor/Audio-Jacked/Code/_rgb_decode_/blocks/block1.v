always@(posedge clk)
	if(reset)
	begin
		R <= 8'd0;
		G <= 8'd0;
		B <= 8'd0;
	end
	else if(buff_num)
		case(data_color_0)
		2'b00:begin
				R <= {3'b110,5'd0}; 
				G <= {3'b110,5'd0};
				B <= {2'b11, 6'd0};
				end
		2'b01:begin
				R <= {3'b000,5'd0}; 
				G <= {3'b010,5'd0};
				B <= {2'b11, 6'd0};
				end
		2'b10:begin
				R <= {3'b111,5'd0}; 
				G <= {3'b001,5'd0};
				B <= {2'b00, 6'd0};
				end
		2'b11:begin
				R <= {3'b001,5'd0}; 
				G <= {3'b100,5'd0};
				B <= {2'b11, 6'd0};
				end
	   endcase