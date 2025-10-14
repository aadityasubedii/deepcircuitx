always @(posedge reset, posedge clk) begin
	if (reset) begin
		serving_port <= 'd0;
		o_wb_adr <= 'd0;
		o_wb_sel <= 'd0;
		o_wb_we  <= 'd0;
		o_wb_dat <= 'd0;
		o_wb_cyc <= 'd0;
		o_wb_stb <= 'd0;
	end else begin
		if (new_access) begin
			if (wbuf_valid[0]) begin
				o_wb_adr        <= wbuf_addr [0];
				o_wb_sel        <= wbuf_be   [0];
				o_wb_we         <= wbuf_write[0];
				o_wb_dat        <= wbuf_wdata[0];
				o_wb_cyc        <= 1'd1;
				o_wb_stb        <= 1'd1;
				serving_port    <= 3'b001;
			end else if (wbuf_valid[1]) begin
				o_wb_adr        <= wbuf_addr [1];
				o_wb_sel        <= wbuf_be   [1];
				o_wb_we         <= wbuf_write[1];
				o_wb_dat        <= wbuf_wdata[1];
				o_wb_cyc        <= 1'd1;
				o_wb_stb        <= 1'd1;
				serving_port    <= 3'b010;
		      end else if (wbuf_valid[2]) begin
				o_wb_adr        <= wbuf_addr [2];
				o_wb_sel        <= wbuf_be   [2];
				o_wb_we         <= wbuf_write[2];
				o_wb_dat        <= wbuf_wdata[2];
				o_wb_cyc        <= 1'd1;
				o_wb_stb        <= 1'd1;
				serving_port    <= 3'b100;
		      end else begin
				o_wb_cyc        <= 1'd0;
				o_wb_stb        <= 1'd0;

				
				
				o_wb_we         <= 1'd0;
				o_wb_adr        <= 'd0;
				o_wb_dat        <= 'd0;

				serving_port    <= 3'b000;
			end    
		end
	end
end