always @(posedge mux_serial_clk, posedge reset) begin
	if(reset) begin
		fs_count <= 8'h00;
		frame_syn <= 1'b0;
		first_fs <= 1'b0;
		last_fs <= 1'b0;
		first_pass <= 1'b0;
	end
	else begin
		if(first_fs == 0) begin
			frame_syn <= i_frame_syn;
			fs_count <= 8'h01;
			if(i_frame_syn == 1) begin
				first_fs <= 1'b1;
			end
			else begin
				first_fs <= 1'b0;
			end
			last_fs <= 1'b0;
			first_pass <= 1'b1;
		end
		else if (last_fs == 0 && i_frame_syn == 1 && first_pass == 0) begin
			first_fs <= first_fs;
			frame_syn <= 1'b1;
			fs_count <= 8'h01;
			last_fs <= i_frame_syn;
			first_pass <= first_pass;
		end
		else if (fs_count < 8'h07 || fs_count == 8'hFF) begin
			first_fs <= first_fs;
			frame_syn <= 1'b1;
			fs_count <= fs_count + 1'b1;
			last_fs <= i_frame_syn;
			first_pass <= first_pass;
		end
		else if (first_pass == 1 && fs_count == 8'h07) begin
			first_fs <= first_fs;
			frame_syn <= 1'b1;
			fs_count <= fs_count + 1'b1;
			last_fs <= i_frame_syn;
			first_pass <= first_pass;
		end
		else begin
			first_fs <= first_fs;
			frame_syn <= 1'b0;
			fs_count <= fs_count + 1'b1;
			last_fs <= i_frame_syn;
			if(first_pass == 1) first_pass <= 1'b0;
			else first_pass <= first_pass;
		end
	end
end