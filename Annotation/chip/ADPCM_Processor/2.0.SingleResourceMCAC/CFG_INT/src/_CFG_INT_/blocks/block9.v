always@ (posedge read_clk or posedge reset) begin
        if (reset) begin
                r_data <= 8'h00;
       end
       else begin
		if(addrs[6]) begin
			if(addrs[5]) begin
				r_data <= {7'b0000000,enc_ready_for_data};
			end
			else begin
				r_data <= {7'b0000000,dec_ready_for_data};
			end
		end
                else if (addrs[5]) begin
                        r_data <= enc_ch[addrs[4:0]];
                end
		else begin
                        r_data <= dec_ch[addrs[4:0]];
                end
        end
end