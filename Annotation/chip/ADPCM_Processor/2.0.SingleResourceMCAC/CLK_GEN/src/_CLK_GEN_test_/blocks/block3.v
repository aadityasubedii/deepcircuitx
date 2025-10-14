initial begin
    
    repeat(2)
        @(posedge clk);
    @(posedge clk);

    
    for (k=0;k<1048576;k=k+1) begin
        if(fs_enabled) begin 
            for (channel = 0; channel<32; channel = channel+1) begin
                for (bits=7; bits>=0; bits = bits-1) begin
                  
if(k>10) begin
		            if(channel == 0 && bits == 7) begin
		                i_frame_syn <= #PROPDLY 1'b1;
		            end
		            else if(channel == 0 && bits != 7) begin
		                    i_frame_syn <= #PROPDLY 1'b1;
		            end
		            else if(channel != 0 && bits == 7) begin
		                i_frame_syn <= #PROPDLY 1'b0;
		            end
		            else begin
		                    i_frame_syn <= #PROPDLY 1'b0;
		            end
end
			@(posedge i_serial_clk);
                    
                end 
            end 
        end 
    end 
end 