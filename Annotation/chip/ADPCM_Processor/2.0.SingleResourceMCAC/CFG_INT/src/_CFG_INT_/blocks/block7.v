always@ (posedge write_clk or posedge reset) begin
        if (reset) begin
                for (i = 0; i<32; i=i+1) begin
                        enc_ch[i] <= 3'b000;
                        dec_ch[i] <= 3'b000;
                end
		encoder_configured <= 32'h00000000;
		decoder_configured <= 32'h00000000;
        end
        else begin
                if (addrs[5]) begin
                        enc_ch[addrs[4:0]]             <= w_data[2:0];
			encoder_configured[addrs[4:0]] <= 1'b1;
                end else begin
                        dec_ch[addrs[4:0]]             <= w_data[2:0];
			decoder_configured[addrs[4:0]] <= 1'b1;
                end

        end
end