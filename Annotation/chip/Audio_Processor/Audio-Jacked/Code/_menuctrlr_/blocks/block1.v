always@(posedge clk)
	case(present_state)
		`menu1:  	 begin
						 menu_in <= 2'b00;
						 filter  <= 3'd0;
						 end
		`menu1_wait: begin
						 menu_in <= 2'b00;
						 filter  <= 3'd0;
						 end
		`menu2: 		 begin
						 menu_in <= 2'b01;
						 filter  <= 3'd0;
						 end
		`menu2_wait: begin
						 menu_in <= 2'b01;
						 filter  <= 3'd0;
						 end						 
		`menu3: 		 begin
						 menu_in <= 2'b10;
						 if(filter1)
							filter  <= 3'd1;
						 else if(filter2)
							filter  <= 3'd2;
						 else if(filter3)
							filter  <= 3'd3;
						 else if(filter4)
							filter <=  3'd4;
						 else	
							filter <=  3'd0;
						 end											
		`menu3_wait: begin
						 menu_in <= 2'b10;
						 filter  <= 3'd0;
						 end
		default:		 begin
						 menu_in <= 2'b00;
						 filter  <= 3'd0;
						 end
	endcase