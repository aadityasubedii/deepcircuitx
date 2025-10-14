module comptadorquarts(clk,reset,quart, nbit);
	
	input clk, reset;
	
	output reg [1:0] quart;
	output reg [4:0] nbit;
	
	reg [6:0] estat;
	reg[6:0] estat_s;
	
	
	always @ (estat or reset or quart or nbit)
	if (estat == 7'd124)
	 begin
	 estat_s = 0;
	 if (reset) begin
		quart = 0;
		nbit = 0;
	 end
	 else begin
		quart = quart + (1'd1 & !reset); //Per evitar que hi hagi el canvi a l'inici del reset
		if (quart == 2'd0) nbit = nbit+ (1'd1 & !reset);
		else nbit = nbit;
	 end
	 end
	else
		begin
		estat_s = estat+7'd1;
		quart = quart;
		nbit = nbit;
		end
	
	    
	always @ (posedge clk or posedge reset)
	if(reset == 1)
	  begin
	  estat <= 7'd124;
	  //quart <= 0;
	  //nbit <= 0;
	  end
	else estat <= estat_s;
	
endmodule
