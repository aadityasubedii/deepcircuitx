// SPDX-License-Identifier: BSD-2-Clause

module tb_dct_t2 ();

reg clk = 0;
reg reset = 0;

reg [15:0] samples [0:3];
wire [15:0] results [0:3];

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,tb_dct_t2);
end

dct_t2 DUT (
	.clk(clk),
	.reset(reset),

	.sample0(samples[0]),
	.sample1(samples[1]),
	.sample2(samples[2]),
	.sample3(samples[3]),

	.out_sample0(results[0]),
	.out_sample1(results[1]),
	.out_sample2(results[2]),
	.out_sample3(results[3])
);

integer idx;
initial begin
//Initialize samples values
for (idx = 0; idx < 4; idx = idx+1) begin
	samples[idx] = idx * 5 + idx + 3;
end
for (idx = 0; idx < 10; idx = idx+1) begin
	@(posedge clk);
end
$finish();
end

//Drive clock
always begin
	#10.000 clk = 0;
	#10.000 clk = 1;
end

endmodule
