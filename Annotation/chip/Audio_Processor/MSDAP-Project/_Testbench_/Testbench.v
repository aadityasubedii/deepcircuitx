`timescale 1ns / 1ps

module Peer_Test;

	// Inputs
	reg Dclk;
	reg Sclk;
	reg Reset_n;
	reg Frame;
	reg Start;
	reg InputL;
	reg InputR;

	// Outputs
	wire InReady_beh;
	wire OutReady_beh;
	wire OutputL_beh;
	wire OutputR_beh;
	
	wire InReady, OutReady;

	wire InReady_rtl;
	wire OutReady_rtl;
	wire OutputL_rtl;
	wire OutputR_rtl;

	// Instantiate the Unit Under Test (UUT)
	MSDAP_top uut_rtl (
		.Dclk(Dclk), 
		.Sclk(Sclk), 
		.Reset_n(Reset_n), 
		.Frame(Frame), 
		.Start(Start), 
		.InputL(InputL), 
		.InputR(InputR), 
		.InReady(InReady_rtl), 
		.OutReady(OutReady_rtl), 
		.OutputL(OutputL_rtl), 
		.OutputR(OutputR_rtl)
	);

	Top uut_beh (
		.Dclk(Dclk), 
		.Sclk(Sclk), 
		.Reset_n(Reset_n), 
		.Frame(Frame), 
		.Start(Start), 
		.InputL(InputL), 
		.InputR(InputR), 
		.InReady(InReady_beh), 
		.OutReady(OutReady_beh), 
		.OutputL(OutputL_beh), 
		.OutputR(OutputR_beh)
	);

	reg [15:0] data [0:15055];

	parameter Dclk_Period = 70; //1295;
	parameter Sclk_Period = 2; //37;
	
	always
	begin
		#(Dclk_Period) Dclk = ~Dclk;
	end
	
	always
	begin
		#(Sclk_Period) Sclk = ~Sclk;
	end
	
	integer i = 39, j = 0, k = 15, fp;
	reg [39:0] writeL = 40'd0, writeR = 40'd0;
	reg reset_flag = 1'b0;
	
	reg OutputL, OutputR;
	assign OutReady = OutReady_beh && OutReady_rtl;
	//assign OutputL = OutputL_beh ^ OutputL_rtl;
	//assign OutputR = OutputR_beh ^ OutputR_rtl;
	assign InReady = InReady_beh && InReady_rtl;
	reg [15:0] mismatches;
	
	initial begin
		fp = $fopen ("output.txt", "w+");
	end
	
	initial begin
		Dclk = 1;
		Sclk = 1;
		Frame = 0;
		InputL = 0;
		InputR = 0;
		Reset_n = 1;
		mismatches = 0;
		$readmemh ("data1.in", data);
		$display ("Read data: ");
    	Start = 1'b1;
		#2; Start = 1'b0;
	end
	
	always @(posedge Dclk)
	begin
		if ((((j == 9458) || (j == 13058)) && reset_flag == 1'b0))
		begin
			Reset_n = 1'b0;
			reset_flag = 1'b1;
			/*if (j == 9456)
				j = 9456;
			else if (j == 13056)
				j = 13056*/
		end
		else if (InReady || reset_flag)
		begin
			if (j < 15056)
			begin
				Reset_n = 1'b1;
				if (k == 15)
					Frame = 1'b1;
				else
					Frame = 1'b0;
				if (k >= 0)
				begin
					InputL = data[j][k];
					InputR = data[j+1][k];
					//$display ("%d %d. %x", (j+1), k, data[j+1]);
					k = k - 1;
				end
				if (k == -1)
				begin
					k = 15;
					j = j + 2;
					if (reset_flag)
						reset_flag = 1'b0;
				end
			end
		end
	end
	
	always @(posedge Sclk)
	begin
		if (OutReady)
		begin
			writeL[i] = OutputL_beh ^ OutputL_rtl;
			writeR[i] = OutputR_beh ^ OutputR_rtl;
			OutputL = OutputL_beh ^ OutputL_rtl;
			OutputR = OutputR_beh ^ OutputR_rtl;
			i = i - 1;
			if (i < 0)
			begin
				$fmonitor(fp, "%H\t %H\n", writeL, writeR);
				i = 39;
				if (!(writeL == 40'd0 && writeR == 40'd0))
					mismatches = mismatches + 1'b1;
			end
		end
	end

endmodule
