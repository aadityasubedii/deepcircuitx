generate
	if(STD_WIDTH >= 16)
    	assign is_std = vid_std[15:0];
	else
    	assign is_std = {{16-STD_WIDTH{1'b0}}, vid_std};
endgenerate