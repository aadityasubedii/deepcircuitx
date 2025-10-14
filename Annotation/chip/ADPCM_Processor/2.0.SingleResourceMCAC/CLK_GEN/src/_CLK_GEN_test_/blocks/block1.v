initial begin
    
    repeat(2)
        @(posedge clk);
    @(posedge clk);
    while(1) begin
        @(posedge clk);
	if(start_fs_check) begin
    	    if(o_frame_syn !== exp_frame_syn) begin
       	     $display("%t ERROR: Frame sync not as expected", $time);
`ifdef ERRORSTOP
           	 $stop;
`endif
            end 
	end 
    end 
end 