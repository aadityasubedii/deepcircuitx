initial begin
    
    start_fs_check = 1'b0;
    repeat(2)
        @(posedge clk);
    @(posedge clk);
    
    for (exp_k=0;exp_k<1048576;exp_k=exp_k+1) begin
        for (exp_channel = 0; exp_channel<32; exp_channel = exp_channel+1) begin
            for (exp_bits=7; exp_bits>=0; exp_bits = exp_bits-1) begin
              
if(k==12) start_fs_check = 1'b1;
if(exp_k>10) begin
                if(exp_channel == 0 && exp_bits == 7) begin
                    exp_frame_syn <= #PROPDLY 1'b1;
                end
                else if(exp_channel == 0 && exp_bits != 7) begin
                        exp_frame_syn <= #PROPDLY 1'b1;
                end
                else if(exp_channel != 0 && exp_bits == 7) begin
                    exp_frame_syn <= #PROPDLY 1'b0;
                end
                else begin
                        exp_frame_syn <= #PROPDLY 1'b0;
                end

end
		@(posedge o_serial_clk);
               
            end 
        end 
    end 
end 