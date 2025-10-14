always @(posedge reset, posedge clk) begin
	if (reset) begin
		start_read	<= 1'b0;
		start_read_buf_1 <= 1'b0;
		start_read_buf_2 <= 1'b0;

		o_wb_dat	<= 32'h0000_0000;

		ack1 <= 1'b0;
		ack2 <= 1'b0;

		se1  <= 15'h0000;
		se2  <= 15'h0000;

		a2p1 <= 16'h0000;
		a2p2 <= 16'h0000;

		sr_out1  <= 16'h0000;
		sr_out2  <= 16'h0000;

		req     <= 1'b0;
		tr      <= 1'b0;
		dq      <= 16'h0000;
		rate_in <= 2'b00;

		a2p_read <= 1'b0;

	end else begin

		ack1  <= MACdone;
		ack2  <= ack1;

		se1 <= se;
		se2 <= se1;

		a2p1 <= a2p_int;
		a2p2 <= a2p1;

		sr_out1  <= sr_int;
		sr_out2  <= sr_out1;

		if (pulseDelay1) begin
			a2p_read <= 1'b0;
		end

		
		if (i_wb_stb & i_wb_cyc & i_wb_we) begin
			case (i_wb_adr[15:0])
				APRSC_REQ:	req <= i_wb_dat[0];
				APRSC_TR:	tr  <= i_wb_dat[0];
				APRSC_DQ:	dq  <= i_wb_dat[15:0];
				APRSC_RATE: rate_in <= i_wb_dat[1:0];
				default:	req <= req;
			endcase
			start_read <= 1'b0;
		end

		
		if (i_wb_stb & i_wb_cyc & (~i_wb_we)) begin
			case (i_wb_adr[15:0])
				APRSC_ACK:	o_wb_dat    <= {31'h0000_0000, ack2};
				APRSC_A2P:	begin
					o_wb_dat    <= {16'h0000, a2p2};
					a2p_read	<= 1'b1;
				end
				APRSC_SE:	o_wb_dat    <= {17'h00000, se2};
				APRSC_SR:	o_wb_dat    <= {16'h0000, sr_out2};
				default:	o_wb_dat    <= 32'hdead_beef;
			endcase
			start_read_buf_1 <= 1'b1;
			start_read_buf_2 <= start_read_buf_1;
			start_read       <= start_read_buf_2;
		end else begin
			start_read_buf_1 <= 1'b0;
			start_read_buf_2 <= 1'b0;
			start_read     <= 1'b0;
		end
	end
end