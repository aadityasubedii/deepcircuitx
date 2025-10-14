// SPDX-License-Identifier: BSD-2-Clause

module dct_t2 (
	input wire clk,
	input wire reset,

	input wire signed [15:0] sample0,
	input wire signed [15:0] sample1,
	input wire signed [15:0] sample2,
	input wire signed [15:0] sample3,

	output reg [15:0] out_sample0,
	output reg [15:0] out_sample1,
	output reg [15:0] out_sample2,
	output reg [15:0] out_sample3
);

real PI = 3.1415926535;
function real dct_coef(input integer idx_n, input integer dct_size, input integer idx_k);
	dct_coef = $cos((PI/dct_size)*idx_k*(idx_n+0.5));
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

wire signed [15:0] sample_group [0:3];
assign sample_group[0] = sample0;
assign sample_group[1] = sample1;
assign sample_group[2] = sample2;
assign sample_group[3] = sample3;
reg [1:0] idx_n = 0;
reg signed [29:0] mac_sample0 = 0;
reg signed [29:0] mac_sample1 = 0;
reg signed [29:0] mac_sample2 = 0;
reg signed [29:0] mac_sample3 = 0;
always @(posedge clk) begin
	idx_n <= idx_n + 2'd1;
	if (idx_n == 2'd0) begin
		out_sample0 <= mac_sample0[29:14];
		out_sample1 <= mac_sample1[29:14];
		out_sample2 <= mac_sample2[29:14];
		out_sample3 <= mac_sample3[29:14];
		
		mac_sample0 <= sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 0), 14);
		mac_sample1 <= sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 1), 14);
		mac_sample2 <= sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 2), 14);
		mac_sample3 <= sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 3), 14);

	end else begin
		mac_sample0 <= mac_sample0 + sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 0), 14);
		mac_sample1 <= mac_sample1 + sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 1), 14);
		mac_sample2 <= mac_sample2 + sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 2), 14);
		mac_sample3 <= mac_sample3 + sample_group[idx_n] * RealToFixed(dct_coef(idx_n, 4, 3), 14);
	end
end

endmodule
