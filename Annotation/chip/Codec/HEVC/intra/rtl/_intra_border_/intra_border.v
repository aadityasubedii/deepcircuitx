`timescale 1ns/1ps
module intra_border (

	xTb			//input
	,yTb
	,pic_width_in_samples
	,pic_height_in_samples
	,first_ctu_in_slice_x
	,first_ctu_in_slice_y
	,first_ctu_in_tile_x
	,first_ctu_in_tile_y
	,last_ctu_in_tile_x
	,last_ctu_in_tile_y
	,nMaxCUlog2
	,tuSize
	
	,isAbove	//output
	,isLeft
	,isTopLeft
	,isRtBorder
	,isLtBorder
	,isBtBorder
	,posBtBorderIn4
	,posRtBorderIn4
);

 	input	[13:0]			pic_width_in_samples;
	input 	[12:0]			pic_height_in_samples;
	input   [8:0]           first_ctu_in_slice_x;
	input   [8:0]           first_ctu_in_slice_y;
	input   [8:0]          	first_ctu_in_tile_x;
	input   [8:0]           first_ctu_in_tile_y;
	input   [8:0]           last_ctu_in_tile_x;
	input   [8:0]           last_ctu_in_tile_y;
	
	wire	[12:0] 			first_ctb_in_slice_x ;
	wire 	[11:0]			first_ctb_in_slice_y ;
	wire 	[12:0] 			first_ctb_in_tile_x ;
	wire	[11:0]			first_ctb_in_tile_y ;
	
	wire	[12:0]			last_ctb_in_tile_x;
	wire	[11:0]			last_ctb_in_tile_y;
	
	reg 	[12:0]			yTbminusOneMaxCu;
	reg		[6:0]			nMaxCB;
	reg		[5:0]			nTB;
	reg		[12:0]			xTbPlusTB;
	reg		[12:0]			yTbPlusTB;
	reg     [6:0]			widthModMaxCU,heightModMaxCU;
	input 	[12:0]			xTb;
	input 	[12:0]			yTb;
	input	[2:0]			tuSize;

	input	[2:0]			nMaxCUlog2;

	output reg 				isAbove;
	output reg 				isLeft;
	output reg 				isTopLeft;
	output reg 				isRtBorder;
	output reg 				isLtBorder;
	output reg  			isBtBorder;
	output reg	[4:0]		posBtBorderIn4,posRtBorderIn4;
	
	
	
	assign 				first_ctb_in_slice_x = (first_ctu_in_slice_x<<nMaxCUlog2);
	assign				first_ctb_in_slice_y = (first_ctu_in_slice_y<<nMaxCUlog2);
	assign				first_ctb_in_tile_x = (first_ctu_in_tile_x<<nMaxCUlog2);
	assign				first_ctb_in_tile_y = (first_ctu_in_tile_y<<nMaxCUlog2);
	assign 				last_ctb_in_tile_x = last_ctu_in_tile_x<<nMaxCUlog2;
	assign				last_ctb_in_tile_y = last_ctu_in_tile_y<<nMaxCUlog2;
	
	always @(*)	begin
		nMaxCB = (1<<nMaxCUlog2);
		nTB = (1<<tuSize);
		xTbPlusTB = xTb + nTB;
		yTbPlusTB = yTb+ nTB ;
		yTbminusOneMaxCu = yTb - nMaxCB;
		widthModMaxCU = (pic_width_in_samples%nMaxCB)==0? nMaxCB:(pic_width_in_samples%nMaxCB);
		heightModMaxCU = (pic_height_in_samples % nMaxCB)==0?nMaxCB:(pic_height_in_samples%nMaxCB);
		if(xTb == 0 																							//frame border
		||(xTb == first_ctb_in_slice_x  &&  yTb==first_ctb_in_slice_y) 											//left slice border
		|| xTb == first_ctb_in_tile_x)																			//tile border
			isLeft = 1'b0;
		else
			isLeft = 1'b1;
			
		if(yTb== 0  																							//frame border
		||  yTb == first_ctb_in_slice_y  																		//left slice border
		||  (xTb<first_ctb_in_slice_x && yTbminusOneMaxCu == first_ctb_in_slice_y)    							//left slice border
		||  yTb == first_ctb_in_tile_y )																		//tile border							
			isAbove = 1'b0;
		else 
			isAbove = 1'b1;
			
		if((xTb == first_ctb_in_slice_x && yTbminusOneMaxCu <= first_ctb_in_slice_y)			//slice border
		|| xTb <=first_ctb_in_slice_x && yTbminusOneMaxCu == first_ctb_in_slice_y 				//slice border
		|| xTb == 0 || yTb == 0 																//frame border
		|| xTb == first_ctb_in_tile_x 															//tile border
		|| yTb == first_ctb_in_tile_y   )														//tile border
			isTopLeft = 1'b0;
		else 
			isTopLeft = 1'b1;
			
		if((xTb + widthModMaxCU >= pic_width_in_samples || xTb >= last_ctb_in_tile_x) )	begin
				isRtBorder = 1;
				posRtBorderIn4 = (xTb + widthModMaxCU >= pic_width_in_samples)? (widthModMaxCU>>2 ) :(nMaxCB>>2);
		end
		else	begin
				isRtBorder = 0;
				posRtBorderIn4 = 16;
		end		
		if(xTb==0 || xTb == first_ctb_in_slice_x || (xTb == first_ctb_in_tile_x && yTbminusOneMaxCu< first_ctb_in_slice_y))
				isLtBorder =1;
		else 
				isLtBorder =0;
				
		if( yTb + heightModMaxCU  >= pic_height_in_samples)	begin
				isBtBorder = 1;
				posBtBorderIn4 = heightModMaxCU>>2;
		end
		else begin
				isBtBorder = 0;
				posBtBorderIn4 = 16;
		end
		
	//	isRtBtBorderTU = ((xTbPlusTB == pic_width_in_samples || xTbPlusTB == last_ctb_in_tile_x+nMaxCB ) &&  (yTbPlusTB == pic_height_in_samples || yTbPlusTB == last_ctb_in_tile_y+nMaxCB ))? 1:0;
	end
	
endmodule