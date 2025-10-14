// SPDX-License-Identifier: BSD-2-Clause

module tb_simple_filterbank ();
reg clk = 1'b0;
reg rst = 1'b0;
reg signed [15:0] sample = 16'h4000;
reg sample_valid = 1'b0;
wire signed [15:0] wso;
wire wso_valid;
reg [15:0] valid_coef = 16'h0;

reg signed [15:0] filter_coef [0:511];

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,tb_simple_filterbank);
end

initial begin
$readmemh("filter_coef.mem", filter_coef);
end

simple_filterbank DUT (
	.clk(clk),
	.rst(rst),
	.sample(sample),
	.sample_valid(sample_valid),
	.windowed_sample_output(wso),
	.wso_valid(wso_valid)
);

integer idx = 0;
initial begin
//Initialize samples values
for (idx = 0; idx < 512; idx = idx+1) begin
	@(posedge sample_valid);
end
@(posedge wso_valid);
for (idx = 0; idx < 512; idx = idx+1) begin
	@(posedge clk);
	valid_coef = {filter_coef[idx][15:1],1'b0};
	if (wso != valid_coef) begin
		$error();
	end
end
$finish();
end

//Drive clock
always begin
	#1.000 clk = 0;
	#1.000 clk = 1;
end

reg [9:0] divider = 10'd0;
always @(posedge clk) begin
	divider <= divider + 10'd1;
	sample_valid <= 1'b0;
	if (divider == 10'd999) begin
		divider <= 10'd0;
		sample_valid <= 1'b1;
	end
end

endmodule
