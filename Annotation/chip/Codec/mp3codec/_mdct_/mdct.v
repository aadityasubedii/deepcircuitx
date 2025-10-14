// SPDX-License-Identifier: BSD-2-Clause

module mdct (
	input wire clk,
	input wire rst,
	input wire signed [31:0] subband_sample,
	input wire subband_sample_valid,
	input wire [4:0] subband_idx,
	output wire signed [15:0] windowed_sample_output,
	output wire wso_valid

);

reg [5:0] granule_idx = 6'd0;
reg signed [31:0] mdct_input_buffer [0:2047]; // TODO: Trim down the buffer width during tuning
reg signed [15:0] mdct_coef [0:2047];

initial begin
$readmemh("zero.mem", mdct_input_buffer);
end

initial begin
$readmemh("mdct_coef.mem", mdct_coef);
end

reg [5:0] granule_work_idx = 6'd0;
reg [4:0] eighteen_counter = 5'd0;
reg [4:0] idx = 5'd0;
reg [5:0] kdx = 6'd0;
reg [5:0] base = 6'd0;

always @(posedge clk) begin
	if (subband_sample_valid) begin
		mdct_input_buffer[{granule_idx, subband_idx}] <= subband_sample;
		if (subband_idx == 5'h1f) begin
			granule_idx <= granule_idx + 6'd1;
			if (eighteen_counter == 5'd17) begin
				eighteen_counter <= 5'd0;
				mdct_mac <= 32'd0;
				get_to_work <= 1'b1;
				granule_offset <= 6'd0;
			end
			if (granule_idx == 6'd35) begin
				granule_idx <= 6'd0;
				granule_offset <= 6'd18;
			end
		end
	end
	if (get_to_work) begin
		mdct_sample <= mdct_input_buffer[{granule_offset,subband_work_idx}];
		granule_offset <= granule_offset + 6'd1;
		mdct_coef_value <= mdct_coef[{kdx,idx}];
		mdct_mac <= mdct_mac + mdct_sample * mdct_coef_value;
		kdx <= kdx + 6'd1;
		if (kdx == 6'd35)
			kdx <= 6'd0;
		idx <= idx + 5'd1;
		if (idx == 5'd17)
			idx <= 5'd0;
		if ((idx == 5'd17) && (kdx == 6'd35))
			subband_work_idx <= subband_work_idx + 5'd1;
	end
end

endmodule
