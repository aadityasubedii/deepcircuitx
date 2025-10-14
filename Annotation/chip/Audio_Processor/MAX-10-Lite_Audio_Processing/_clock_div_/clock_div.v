module clock_div
#(parameter DIVISOR = 16)
(
input clk, reset,
output reg div_clk);

reg [31:0] count;

assign count_test = count;

initial
	begin
	div_clk <= 1'b0;
	count <= 32'h0000;
	end
	
always @(posedge clk)
begin
	count <= count + 32'd1;
	
	if(count>=(DIVISOR-1))
		count <= 32'h0000;
 
 div_clk <= (count<DIVISOR/2)?1'b1:1'b0;

 end
endmodule
