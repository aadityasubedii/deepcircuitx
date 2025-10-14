// SPDX-License-Identifier: BSD-2-Clause

module filterbank (
	input wire clk,
	input wire rst,
	input wire signed [15:0] sample,
	input wire sample_valid,
	output wire signed [31:0] subband_sample,
	output wire subband_sample_valid,
	output wire [4:0] granule_idx, // For testing purposes, remove once done?
	output wire signed [15:0] windowed_sample_output,
	output wire wso_valid

);

wire [3:0] sample_block_offset;
reg [8:0] sample_idx = 9'd0;
assign sample_block_offset = sample_idx[8:5];

reg signed [15:0] sample_ebr [0:511];
reg signed [15:0] filter_coef [0:511];
reg signed [15:0] windowed_ebr [0:127];
reg signed [15:0] matrix_m [0:2047];
reg write_windowed_msb = 1'b0;
reg wwm_r1 = 1'b0;
reg wwm_r2 = 1'b0;
reg wwm_r3 = 1'b0;
reg read_windowed_msb = 1'b0;
reg [3:0] read_offset_msb = 4'd0;
reg [4:0] read_offset_lsb = 5'd0;
wire [8:0] read_sample_offset = {read_offset_msb, read_offset_lsb};
reg signed [15:0] read_sample = 16'd0;
reg signed [15:0] read_coef = 16'd0;
reg [8:0] coef_idx = 9'd0;
reg filtering = 1'b0;
reg filtering_r1 = 1'b0;
reg filtering_r2 = 1'b0;
reg filtering_r3 = 1'b0;
reg filtering_r4 = 1'b0;
reg filtering_r5 = 1'b0;
reg signed [31:0] windowed_sample = 32'd0;
reg signed [31:0] sum_windowed_sample = 32'd0;
reg [5:0] windowed_idx = 6'd0;
reg [5:0] subsample_idx = 6'd0;
reg [4:0] subband_idx = 5'd0;
reg signed [31:0] polyphase_acc = 31'd0;
reg signed [31:0] polyphase_mult = 31'd0;
reg y_sum = 1'b0;
reg y_sum_r1 = 1'b0;
reg y_sum_r2 = 1'b0;
reg y_sum_r3 = 1'b0;
reg polyphase_reset_bubble = 1'b0;
reg prb_r1 = 1'b0;
reg prb_r2 = 1'b0;
reg prb_r3 = 1'b0;
reg do_old_block = 1'b0;
reg signed [15:0] subsample = 16'd0;
reg signed [15:0] matrix_m_coef = 16'd0;

assign windowed_sample_output = windowed_sample[30:15];
assign wso_valid = filtering_r2;
assign subband_sample = polyphase_acc;
assign subband_sample_valid = prb_r3;
assign granule_idx = subband_idxr3;

initial begin
$readmemh("zero.mem", sample_ebr);
end

initial begin
$readmemh("filter_coef.mem", filter_coef);
end

real PI = 3.1415926535;
function real polyphase_coef(input integer idx_i, input integer idx_k);
	polyphase_coef = $cos((PI)*(2.0*idx_i+1.0)*(idx_k-16.0)/64.0);
endfunction
integer Whole;
real Fractional;
function signed [15:0] RealToFixed(input real in, input integer fpf);
begin
	Whole = (in >= 0 ? $rtoi($floor(in)) : $rtoi($ceil(in)));
	Fractional = in - $itor(Whole);
	RealToFixed = (Whole << fpf) | $rtoi((Fractional * (1 << fpf)));
end
endfunction

integer idx_i, idx_k;
initial begin
for (idx_i = 0; idx_i < 32; idx_i = idx_i+1) begin
	for (idx_k = 0; idx_k < 64; idx_k = idx_k+1) begin
		matrix_m[idx_k+idx_i*64] = RealToFixed(polyphase_coef(idx_i, idx_k), 14);
	end
end
end

always @(posedge clk) begin
	filtering_r1 <= filtering;
	filtering_r2 <= filtering_r1;
	filtering_r3 <= filtering_r2;
	filtering_r4 <= filtering_r3;
	filtering_r5 <= filtering_r4;
	y_sum <= sample_valid | do_old_block;
	y_sum_r1 <= y_sum;
	y_sum_r2 <= y_sum_r1;
	y_sum_r3 <= y_sum_r2;
	polyphase_reset_bubble <= 1'b0;
	prb_r1 <= polyphase_reset_bubble;
	prb_r2 <= prb_r1;
	prb_r3 <= prb_r2;
	subband_idxr1 <= subband_idx;
	subband_idxr2 <= subband_idxr1;
	subband_idxr3 <= subband_idxr2;
	wwm_r1 <= write_windowed_msb;
	wwm_r2 <= wwm_r1;
	wwm_r3 <= wwm_r2;
	if (sample_valid) begin
		sample_ebr[sample_idx] <= sample;
		sample_idx <= sample_idx + 9'd1;
		if (sample_idx[4:0] == 5'h00) begin
			read_offset_msb[0] <= sample_block_offset[0];
		end
	end
	if (y_sum) begin
		y_sum <= 1'b1;
		read_offset_msb <= read_offset_msb + 4'd2;
		coef_idx <= coef_idx + 9'd64;
		read_sample <= sample_ebr[read_sample_offset];
		read_coef <= filter_coef[coef_idx];
		if (read_offset_msb[3:1] == 3'b111) begin
			y_sum <= 1'b0;
			read_offset_msb[0] <= ~read_offset_msb[0];
			do_old_block <= 1'b0;
			if (do_old_block) begin
				coef_idx <= coef_idx + 9'd1;
				if (read_offset_msb[0] == sample_block_offset[0]) begin
					filtering <= 1'b1;
					write_windowed_msb <= ~write_windowed_msb;
				end
			end else begin
				coef_idx <= coef_idx + 9'd32;
				do_old_block <= 1'b1;
			end
		end
	end
	if (y_sum_r1) begin
		windowed_sample <= read_sample * read_coef;
	end
	if (y_sum_r2) begin
		sum_windowed_sample <= sum_windowed_sample + windowed_sample;
	end else begin
		sum_windowed_sample <= 32'd0;
		if (y_sum_r3) begin
			windowed_idx <= windowed_idx + 9'd1;
			windowed_ebr[{wwm_r3, windowed_idx}] <= sum_windowed_sample[30:15];
		end
	end
	if (filtering_r3) begin
		if (~polyphase_reset_bubble) begin
			subsample <= windowed_ebr[{read_windowed_msb, subsample_idx}];
			matrix_m_coef <= matrix_m[{subband_idx,subsample_idx}];
			subsample_idx <= subsample_idx + 1;
		end
		if (subsample_idx == 6'h3f) begin
			polyphase_reset_bubble <= 1'b1;
			subband_idx <= subband_idx + 1;
			if (subband_idx == 5'd31) begin
				filtering <= 1'b0; //TODO: Optimize this
			end
		end
	end
	if (filtering_r4) begin
		polyphase_mult <= subsample * matrix_m_coef;
	end
	if (filtering_r5) begin
		if (prb_r3) begin
			polyphase_acc <= 32'd0;
		end else begin
			polyphase_acc <= polyphase_acc + polyphase_mult;
		end
	end

end

always @(posedge clk) begin
end

endmodule
