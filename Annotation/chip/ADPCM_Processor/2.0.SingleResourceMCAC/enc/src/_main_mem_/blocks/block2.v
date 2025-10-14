	always @( posedge reset, posedge clk ) begin
		if (reset) begin
			start_read_d1 <= 'd0;
			start_read_d2 <= 'd0;
			wb_rdata32 <= 'd0;
		end else begin
			start_read_d1   <= start_read;
			start_read_d2   <= start_read_d1;
			if ( start_read_d1 ) begin
				wb_rdata32 <= addr_d1[1:0] == 2'd0 ? rd_data[ 31: 0] :
						  addr_d1[1:0] == 2'd1 ? rd_data[ 63:32] :
						  addr_d1[1:0] == 2'd2 ? rd_data[ 95:64] :
								             rd_data[127:96] ;
			end
		end
	end