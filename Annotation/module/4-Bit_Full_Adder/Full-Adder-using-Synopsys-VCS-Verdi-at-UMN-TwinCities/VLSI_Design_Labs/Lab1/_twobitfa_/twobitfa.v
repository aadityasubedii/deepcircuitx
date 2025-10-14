// define a two-bit full adder
module twobitfa(sum, c_out, a, b, c_in);

// I/O declaration
output [1:0]  sum;        
output c_out;
input [1:0] a, b;
input c_in;

// internal wire
wire c1;

fulladd fa0(sum[0], c1, a[0], b[0], c_in);
fulladd fa1(sum[1], c_out, a[1], b[1], c1);

endmodule

module stimulus;

reg [1:0] A, B;
reg C_IN;
wire [1:0] SUM;
wire C_OUT;

twobitfa fa2(SUM, C_OUT, A, B, C_IN);

initial
begin
	$monitor($time, " A = %d, B = %d, C_IN = %d, SUM = %d, C_OUT = %d\n", A, B, C_IN, SUM, C_OUT);
end

initial
begin
	A = 2'd1; B = 2'd2; C_IN = 1'd0;
	#2 A = 2'd0; B = 2'd1; C_IN = 1'd1;
	#2 A = 2'd2; B = 2'd1; C_IN = 1'd1;
end

endmodule
