module adcclkgen2(clk, reset, adcclk, tin);
	
	input clk, reset, tin;
	output adcclk;
	
	wire [4:0] estat_s; 
	reg [4:0] estat;
	
	assign estat_s = tin ? estat + 5'd1 : estat;
	assign adcclk = estat[4];
	
	always @ (posedge clk or posedge reset)
	if(reset == 1) estat <= 0;
	else estat <= estat_s;

endmodule
