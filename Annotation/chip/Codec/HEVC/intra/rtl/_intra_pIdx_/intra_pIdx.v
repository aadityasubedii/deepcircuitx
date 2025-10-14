`timescale 1ns/1ps
module intra_pIdx (
	xTb,
	yTb,
	tuSize,
	pIdx
);

	parameter isChroma =0;
     input  [12:0]   xTb;
	 input  [12:0]   yTb;
     input  [2:0]    tuSize;
     output  [1:0]    pIdx;
	 
	 wire y,x;
	 assign y = (yTb>>tuSize)%2;
	 assign x = (xTb>>tuSize)%2;

	
	assign pIdx = (isChroma && tuSize==5)?0:{y,x};
		
    
endmodule 