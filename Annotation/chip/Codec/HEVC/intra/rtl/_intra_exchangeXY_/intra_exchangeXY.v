/*
    NAME:
        intra_exchangeXY.v
        
    DESCRIPTION:
        This module is used for transposing the position X,Y and recSample when mode is horizontal ( 2-17).
		Because the rec. samples are to be stored back to SRAMs, and the addresses are related to the position X,Y. Transpose is necessary for simplification in the next module,getWAdr_Data. 
		When mode is horizontal, new(X,Y) <=  orig(Y,X
		
    NOTES:
        
    TO DO:
        
    AUTHOR:
        Jianbin Zhou
        
	REVISION HISTORY:
        14.05.03    Initial.
        
*/
`timescale 1ns/1ps
module intra_exchangeXY(
	modeHor
	,isInter
	,i_X
	,i_Y	
	,o_X
	,o_Y
);

	input modeHor;
	input [2:0] i_X,i_Y;	
	input isInter;

	output reg [2:0] o_X,o_Y;
	

	   always @(*)  begin   
		  if(modeHor && !isInter)	begin
			o_X = i_Y;
			o_Y = i_X;
			end
		  else begin
			o_X = i_X;
			o_Y = i_Y;
		  end
	  end

endmodule