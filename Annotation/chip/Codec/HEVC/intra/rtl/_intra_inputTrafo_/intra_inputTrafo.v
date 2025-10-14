`timescale 1ns/1ps
module intra_inputTrafo(
	xCtb,
	yCtb,
	xTb_rela,
	yTb_rela,
	i_tuSize,
	xTb,
	yTb,
	tuSize
);
	parameter				isChroma=0;

	input [8:0]				xCtb,yCtb;
	input [3:0]				xTb_rela,yTb_rela;
	input	[2:0]			i_tuSize;
	
	output	[12:0]			xTb;
	output	[12:0]			yTb;
	output	[2:0]			tuSize;
	
	wire	[12:0]			xTb_;
	wire	[12:0]			yTb_; 
	
	assign tuSize = (isChroma && i_tuSize!=2)? (i_tuSize-1):i_tuSize;
	assign xTb_ = 	(xCtb<<4) + (xTb_rela<<2);
	assign yTb_ = 	(yCtb<<4) + (yTb_rela<<2);	

	assign xTb = isChroma? (i_tuSize==2? ((xTb_-4)>>1):(xTb_>>1)): xTb_;
	assign yTb = isChroma? (i_tuSize==2? ((yTb_-4)>>1):(yTb_>>1)): yTb_;
	
endmodule
