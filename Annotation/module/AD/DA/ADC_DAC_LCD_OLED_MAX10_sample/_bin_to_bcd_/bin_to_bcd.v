
module bin_to_bcd (iBIN, oBCD);

	input [19:0] iBIN;
	output [23:0] oBCD;

	reg [3:0] HofThous;
	reg [3:0] TofThous;
	reg [3:0] Thousands;
	reg [3:0] Hundreds;
	reg [3:0] Tens;
	reg [3:0] Ones;


	assign oBCD[23:20] = HofThous;
	assign oBCD[19:16] = TofThous;
	assign oBCD[15:12] = Thousands;
	assign oBCD[11:8] = Hundreds;
	assign oBCD[7:4] = Tens;
	assign oBCD[3:0] = Ones;
	
	integer i;
	
	always @(iBIN)
	begin
		HofThous = 4'b0;
		TofThous = 4'b0;
		Thousands = 4'b0;
		Hundreds = 4'b0;
		Tens = 4'b0;
		Ones = 4'b0;
		
		for(i = 19; i >= 0; i = i - 1)
		begin
			if(HofThous >= 5) 	HofThous = HofThous + 4'h3;
			if(TofThous >= 5) 	TofThous = TofThous + 4'h3;
			if(Thousands >= 5)	Thousands = Thousands + 4'h3;
			if(Hundreds >= 5) 	Hundreds = Hundreds + 4'h3;
			if(Tens >= 5) 			Tens = Tens + 4'h3;
			if(Ones >= 5) 			Ones = Ones + 4'h3;
		
			
			HofThous = HofThous << 1;
			HofThous[0] = TofThous[3];
			
			TofThous = TofThous << 1;
			TofThous[0] = Thousands[3];	
			
			Thousands = Thousands << 1;
			Thousands[0] = Hundreds[3];
			
			Hundreds = Hundreds << 1;
			Hundreds[0] = Tens[3];
			
			Tens = Tens << 1;
			Tens[0] = Ones[3];
			
			Ones = Ones << 1;
			Ones[0] = iBIN[i];
		end
	end
endmodule






