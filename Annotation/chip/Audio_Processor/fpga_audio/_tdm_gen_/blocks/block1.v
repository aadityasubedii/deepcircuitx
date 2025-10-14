    always @(negedge bclk)begin
        if(wc_ff == 2'b01)
            bclk_cnt <= 6'd62;
		else begin
			bclk_cnt <= bclk_cnt - 6'd1;
		end
    end