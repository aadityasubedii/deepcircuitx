module mclkgen(clk,reset,mclk,bclk);
	
	input clk, reset;
	
	output mclk, bclk;
	
	reg [1:0] estat;
	reg [1:0] estat_s;
	reg [2:0] bcont;
	
	
	always @ (estat or reset or bcont)
	begin
		estat_s = estat+2'd1;
		if (reset == 1) bcont = 0;
		else if (estat == 2'd0) bcont = bcont+3'd1;
	
	end
	
	always @ (posedge clk or posedge reset)
	
	if(reset == 1) 
	begin
		estat <= 0;
		//bcont <= 0;
	end
	else estat <= estat_s;
	
	
	assign mclk = estat[1];
	assign bclk = bcont[2];
	
endmodule
