`timescale 1ns/1ps
module intra_util_w(
	clk,
	rst_n,
	arst_n,
	bStop
	,bStop_1_1
	,xTb
	,yTb
	,l_xTb
	,l_yTb
	,X
	,Y
	,l_X
	,l_Y
	,tuSize
	,partIdx
	,nMaxCUlog2
	,verFlag
	,horFlag
	,isCalStage
	,opt_w_tl_
	,opt_w_
	,w_TL_rela_
);


	
	input 								clk,rst_n,arst_n,bStop,bStop_1_1;
	input [12:0]						xTb,l_xTb;
	input [12:0]						yTb,l_yTb;
	input [2:0]							X,Y,l_X,l_Y;
	input [2:0] 						tuSize;

	input [1:0]							partIdx;
	input [2:0]							nMaxCUlog2;
	input [15:0]						verFlag,horFlag;
	input								isCalStage;

	reg	[13:0]							xTbPlusXmin1;
	reg	[12:0]							yTbPlusXmin1;

	reg [3:0] 							x_4inMaxCb,y_4inMaxCb; 

	reg [6:0] 							nPB,nMaxCb;
	reg [2:0] 							nPBsf2m1;
	reg [6:0]							y_bar,x_bar;
	reg [5:0] 							Xplus1sf2,Yplus1sf2;
	reg	[5:0]	  						nMaxCbm1;
	
	reg	[2:0]							opt_w_tl;
	output reg	[2:0]					opt_w_tl_;
	reg [2:0]							opt_w[7:0];
	output reg [3*8-1:0]				opt_w_;
	output reg [4:0]					w_TL_rela_;
	reg signed [4:0] 					w_TL_rela;
	
	always @ (posedge clk or negedge arst_n) begin
		if(!arst_n) 
			{opt_w_tl_,opt_w_,w_TL_rela_,x_bar,y_bar} <= 0;
		else if(!rst_n)
			{opt_w_tl_,opt_w_,w_TL_rela_,x_bar,y_bar} <= 0;
		else begin
			if(!bStop) 
				{opt_w_tl_,opt_w_,w_TL_rela_} <= {opt_w_tl,opt_w[0],opt_w[1],opt_w[2],opt_w[3],opt_w[4],opt_w[5],opt_w[6],opt_w[7],w_TL_rela};
			if(!bStop_1_1) begin
				{x_bar} <= (xTbPlusXmin1%nMaxCb);
				{y_bar} <= (yTbPlusXmin1%nMaxCb);
			end
		end
	
	end
	
	always @(*)	begin
		
		Xplus1sf2 = (l_X+1)<<2;
		Yplus1sf2 = (l_Y+1)<<2;
		
		xTbPlusXmin1 = l_xTb+Xplus1sf2-1;
		yTbPlusXmin1 = l_yTb+Yplus1sf2-1;
		
	/*	Xplus1sf2 = (X+1)<<2;
		Yplus1sf2 = (Y+1)<<2;
		xTbPlusXmin1 = xTb+Xplus1sf2-1;
		yTbPlusXmin1 = yTb+Yplus1sf2-1;
	*/	
		nMaxCb = (1<<nMaxCUlog2);
		nMaxCbm1 = nMaxCb-1;
		nPB = 1<<tuSize;
		x_4inMaxCb = (xTb%nMaxCb>>2)+X;
		y_4inMaxCb = (yTb%nMaxCb>>2)+Y;
		nPBsf2m1 = (nPB>>2)-1;
		
	/*	
		x_bar = xTbPlusXmin1%nMaxCb;
		y_bar = yTbPlusXmin1%nMaxCb;
*/

	end


	always @(*) begin

		opt_w_tl = 0;
		w_TL_rela = 0;
		if( y_bar==nMaxCbm1) begin				//last row in CTU,  write to  TL_a zone
			opt_w_tl = 1;
			w_TL_rela = 0;
		end
		if (y_bar!=nMaxCbm1 && x_bar >= y_bar && x_bar!=nMaxCbm1 && (X == nPBsf2m1 || Y == nPBsf2m1))	begin 		//in the top-right zone, and not the rightmost col.,  write to TL_b zone			
			opt_w_tl = 2;
			w_TL_rela = ((x_bar>>2)-(y_bar>>2));
			end
		if( y_bar!=nMaxCbm1 && x_bar > y_bar && x_bar==nMaxCbm1 && (y_bar!=(nMaxCbm1>>1) || (y_bar==(nMaxCbm1>>1) &&(xTb>>nMaxCUlog2)%2==0)) )	begin	//TL_c zone    xTb[nMaxCUlog2]==0 <==> (xTb>>nMaxCUlog2)[0]==0      C_n- = 16-(x-y)/4
			opt_w_tl = 3;
			w_TL_rela = ((y_bar>>2)-(x_bar>>2));
			end
		if (y_bar!=nMaxCbm1 && x_bar > y_bar && x_bar==nMaxCbm1 && y_bar==(nMaxCbm1>>1) && (xTb>>nMaxCUlog2)%2==1)	begin			//TL_c_odd zone 
			opt_w_tl = 4;
			w_TL_rela = 0;
			end
		if ( y_bar!=nMaxCbm1 && x_bar < y_bar && y_bar!=nMaxCbm1 && (X == nPBsf2m1 || Y == nPBsf2m1))	begin				//TL_d zone 		D_n = ((Y-X)>>2)-1 + 2072 
			opt_w_tl = 5;
			w_TL_rela = ((y_bar>>2)-(x_bar>>2));
		end
	
	end
	/* write to SRAM TL     --------> */

	/*<--------  write to SRAM 0 to 7*/
	generate
		genvar t;
		for(t=0;t<8; t=t+1)begin		:xt
			always @(*) begin
				// Can not be written in this way.
				 if(( X == nPBsf2m1 || Y == nPBsf2m1) && isCalStage ) begin			//opt##: if( ((X+1)<<2) == (1<<tuSize) || (Y+1)<<2) == (1<<tuSize) )
					  if(t == (~y_4inMaxCb)%8  && X == nPBsf2m1 &&  (tuSize!=2 || (tuSize==2 && partIdx[0]==1)))
							begin																									// write zone b or d or  b', d'			
								if((verFlag[y_4inMaxCb]==1))	begin
									opt_w[t] = 1;							
								end
								else	begin
									opt_w[t] = 2;							
								end
						end
					 else if(t== ((~y_4inMaxCb)%8+4)%8 && (X == nPBsf2m1) && (tuSize!=2 || (tuSize==2 && partIdx[0]==1)))
							begin
								if((verFlag[y_4inMaxCb]==1))	
									opt_w[t] = 3;						
								else	
									opt_w[t] = 4;								
							end
					else if(t == x_4inMaxCb%8 && Y == nPBsf2m1 && (tuSize!=2 ||  (tuSize==2  && partIdx!=1))) 
						begin
					// write zone a or c  or e		
							if(y_bar==nMaxCbm1)			//write zone a
								opt_w[t] = 5;							
							else begin 
								if(horFlag[x_4inMaxCb]==1)	
									opt_w[t] = 6;									
								else
									opt_w[t] = 7;				
							end
					end
					else 
						opt_w[t] = 0;
				end	
				else
					opt_w[t] = 0;
					
			end
		end
	endgenerate
	/* write to SRAM 0 to 7     --------> */
	
endmodule