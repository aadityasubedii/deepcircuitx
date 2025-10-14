always @*
case (low_selector) 
	4'b0000:	low_mask = 16'hffff;
	4'b0001:	low_mask = 16'hfffe;
	4'b0010:	low_mask = 16'hfffc;
	4'b0011:	low_mask = 16'hfff8;
	4'b0100:	low_mask = 16'hfff0;
	4'b0101:	low_mask = 16'hffe0;
	4'b0110:	low_mask = 16'hffc0;
	4'b0111:	low_mask = 16'hff80;
	4'b1000:	low_mask = 16'hff00;
	4'b1001:	low_mask = 16'hfe00;
	4'b1010:	low_mask = 16'hfc00;
	4'b1011:	low_mask = 16'hf800;
	4'b1100:	low_mask = 16'hf000;
	4'b1101:	low_mask = 16'he000;
	4'b1110:	low_mask = 16'hc000;
	4'b1111:	low_mask = 16'h8000;
endcase