`timescale 1ns/1ps
module intra_s2RefSubsti(
	pseuAdr,
	isAbove,
	isLeft,
	isTopLeft,
	tuSize,
	nMaxCUlog2,
	isBtBorder,
	isRtBorder,
	posBtBorderIn4,
	posRtBorderIn4,
	data,
	data_tl,
	horLevel_i, 
	verLevel_i,
	verFlag,
	sub_data,
	sub_tl,
	partIdx,
	pre_tuSize,
	pre_xTb,
	pre_modeHor,
	xTb,
	xTbInCU,
	yTbInCU,
	byPa_P_A_2,
	byPa_P_A_2_cr,
	byPa_DW_A_3,
	bp_pos_1,
	bp_pos_2,
	bp_pos_3,
	order,
	clk,
	rst_n,
	arst_n,
	bStop,
	i_modiPosIn4,
	awkCnt,
	cIdx,

	by4_1_forStop,
	by4_1_forStop_cr,
	by4_1_forStop_pos,
	substi_Opt,
	gp_bitDepth
);

	parameter						isChroma =0;
	parameter 		 				bitDepth = 8;
	parameter						nSRAMs 		=8;
	parameter						SRAMDW      = bitDepth*4;

	input							clk,rst_n,arst_n,bStop;
	input [nSRAMs*3-1:0]			pseuAdr;
	input 							isAbove;
	input							isLeft;
	input							isTopLeft;
	input							isBtBorder;
	input							isRtBorder;
	input [4:0]						posBtBorderIn4,posRtBorderIn4;
	input [12:0]					xTb,pre_xTb;
	input [2:0]						tuSize,pre_tuSize;
	input							pre_modeHor;
	input [bitDepth*32-1:0]			data;
	input [bitDepth-1:0]			data_tl;
	input [16*4-1:0]				horLevel_i;
	input [16*4-1:0]				verLevel_i;
	input [15:0]					verFlag;
	input [3:0]						gp_bitDepth;
	input [1:0]     				partIdx;
	input [2:0]						order;
	input [6:0]      				xTbInCU ,yTbInCU;
	input [bitDepth*16-1:0]       	byPa_P_A_2;				//{r_l,r_t,
															//r_br01_4,r_br01_8,r_br01_16,r_br01_32,r_br01_64,
															//r_br2_8,r_br2_16,r_br2_32,r_b,r_rt,
															//4samples}
	input [bitDepth*11-1:0]       	byPa_P_A_2_cr;				//{r_l_cr,r_t_cr,
																//r_br01_4_cr,r_br01_8_cr,r_br01_16_cr,r_br01_32_cr,
																//r_br2_8_cr,r_br2_16_cr,r_br2_32_cr,r_b_cr,r_rt_cr};
															
															
	input [bitDepth*4-1:0] 			byPa_DW_A_3;			//{samples x 4}
	input [5:0]						bp_pos_1,bp_pos_2,bp_pos_3;
	input [5*nSRAMs-1:0]			i_modiPosIn4;
	input [2:0]						nMaxCUlog2;
	input [2:0]						awkCnt;
	input [bitDepth*4-1:0]			by4_1_forStop,by4_1_forStop_cr;
	input [4:0]						by4_1_forStop_pos;
	input [1:0]						cIdx;
	
	
	wire [4:0]						bypa_pos_1,bypa_pos_2,bypa_pos_3;
	wire							bp_f_1,bp_f_2,bp_f_3;
	wire [6:0]						nMaxCB = (1<<nMaxCUlog2);
	wire [5:0]						nMaxCBin4 = nMaxCB >>2;
	wire [2:0]						cnt_by2,cnt_by3;
	wire 							cnt_by1= 0;
	
	wire							isTpInCB=(yTbInCU==0);
	
	assign bypa_pos_1 = bp_pos_1[4:0];	
	assign bypa_pos_2 = bp_pos_2[4:0];
	assign bypa_pos_3 = bp_pos_3[4:0];
	assign bp_f_1 = bp_pos_1[5];
	assign bp_f_2 = bp_pos_2[5];
	assign bp_f_3 = bp_pos_3[5];
	
	output reg [bitDepth*32-1:0]	sub_data;
	output reg [bitDepth-1:0]		sub_tl;
	
	output  reg [3*8+1:0]			substi_Opt;
	reg	[2:0]						substi_Opt_[7:0];
	
	reg [bitDepth-1:0]				temp_tl;
	reg [bitDepth*4-1:0] 			srambank[7:0];
	reg [bitDepth*4-1:0] 			sub_srambank[7:0];
	reg [bitDepth-1:0] 				pixel_SRAM[7:0][3:0];
	reg [bitDepth-1:0] 				pixel_32Reg_SRAM[7:0][3:0];
	reg [bitDepth-1:0] 				sub_pixel[7:0][3:0];
	reg [2:0]						adr[7:0];
	reg [bitDepth-1:0] 				temp_sub[7:0][3:0]; 
	
	reg [bitDepth-1:0]				r_l,r_t,r_b,r_rt;
	reg [bitDepth-1:0]				r_br01_4,r_br01_8,r_br01_16,r_br01_32,r_br01_64;
	reg [bitDepth-1:0]				r_br2_8,r_br2_16,r_br2_32;
	
	reg [4:0]						val_top0[7:0],val_left0[7:0];
	
	reg [5:0]						ankor_x,ankor_y;
	
	reg [bitDepth:0]				halfVal;
	reg [4:0] 						horLevel[15:0];
	reg [4:0] 						verLevel[15:0];
	reg [bitDepth-1:0]				r_TL;			//registers for top-left samples fetched in first cycle in TB;
	
	reg [bitDepth-1:0]				bp2_4samp[3:0];
	reg [bitDepth-1:0]				bp3_4samp[3:0];
	reg [bitDepth-1:0]				bp_stop_4samp[3:0];
	reg 							l1_xTb_gtP,l2_xTb_gtP;
	reg [2:0]						l1_pre_tuSize,l2_pre_tuSize,l3_pre_tuSize;
	reg 							l1_pre_modeHor,l2_pre_modeHor;
	reg								bNull;
	reg [4:0]						nTBin4;
	reg [4:0]						yTbin4PlusnTBin4,yTbin4Plusn2TBin4;
	reg [4:0]						xTbin4PlusnTBin4;

	reg [3:0]						xTbInCUin4,yTbInCUin4;	
	reg [4:0]						posIn4[7:0];
	reg 							bOnlyLeft;
	reg 							b0,b02,b03,b04,b1,b12,b13,b2,b23;
		
	wire							is_topl_sub_s3;
	wire							channel_Cr;
	wire							xTb_ltP,xTb_gtP;
	
	generate 
		genvar t;
		for(t=0;t<16;t=t+1)	begin: xt
			always @(*) begin
				verLevel[t]  =  verLevel_i[63-4*t:60-4*t];
				horLevel[t]	 =  horLevel_i[63-4*t:60-4*t];
			
			end
		end
	endgenerate
	
	assign 						xTb_ltP = xTb < pre_xTb;
	assign						xTb_gtP = xTb > pre_xTb;
	
	always  @ (*) begin
		xTbInCUin4 = xTbInCU>>2;
		yTbInCUin4 = yTbInCU>>2;
		nTBin4 = (1<<tuSize)>>2;
		yTbin4PlusnTBin4 = yTbInCUin4+nTBin4;
		yTbin4Plusn2TBin4 = yTbin4PlusnTBin4+nTBin4;
		xTbin4PlusnTBin4 = xTbInCUin4+nTBin4;
		ankor_x = nTBin4-1+xTbInCUin4;
		ankor_y = nTBin4-1+yTbInCUin4;
		halfVal = (1<<gp_bitDepth)>>1;
		bNull = !isAbove && !isLeft && !isTopLeft;
		bOnlyLeft = (!isAbove && !isTopLeft && isLeft);
		
		b0 = (tuSize!=2 && order==0);
		b02 = (b0 && pre_tuSize ==2);
		b03 = (b0 && pre_tuSize ==3);
		b04 = (b0 && pre_tuSize ==4);
		b1 = (tuSize!=2 && order==1);
		b12 = (b1 && l1_pre_tuSize ==2);
		b13 = (b1 && l1_pre_tuSize ==3);
		b2 = (tuSize!=2 && order==2);
		b23 = b2 && l2_pre_tuSize ==3;
			
		{bp3_4samp[0],bp3_4samp[1],bp3_4samp[2],bp3_4samp[3]} = byPa_DW_A_3;
	end

	
	
	generate
		genvar e;
			for(e=0;e<4;e=e+1)	begin:xe
				always@(*) begin
					if(cIdx[1]==0)
						bp_stop_4samp[e] = by4_1_forStop[bitDepth*4-1-bitDepth*e:  bitDepth*3 -  bitDepth*e];	
					else
						bp_stop_4samp[e] = by4_1_forStop_cr[bitDepth*4-1-bitDepth*e:  bitDepth*3 -  bitDepth*e];	
				end
			end
	endgenerate
	
	
	
	always @(*) begin
		{r_br01_64,bp2_4samp[0],bp2_4samp[1],bp2_4samp[2],bp2_4samp[3]} = 0;
		if(cIdx!=2)
			{r_l,r_t,r_br01_4,r_br01_8,r_br01_16,r_br01_32,r_br01_64,r_br2_8,r_br2_16,r_br2_32,r_b,r_rt,bp2_4samp[0],bp2_4samp[1],bp2_4samp[2],bp2_4samp[3]} = byPa_P_A_2;
		else	begin
			{r_l,r_t,r_br01_4,r_br01_8,r_br01_16,r_br01_32,r_br2_8,r_br2_16,r_br2_32,r_b,r_rt} = byPa_P_A_2_cr;
			end
			
	end
	
	always @(*)	begin
		if(!isAbove && !isLeft && !isTopLeft)
			temp_tl = halfVal;
		else if (!isAbove && !isTopLeft)		
			temp_tl = r_t;
		else if (!isLeft && !isTopLeft)	
			temp_tl = r_l;
		else if(!isTopLeft) 
			temp_tl = r_t;
		else if(order==0)
			temp_tl = data_tl;
		else 
			temp_tl = r_TL;
	end
	
	reg [7:0]			p1,p2,p3;
	reg	[7:0]			c0,c1,c2,c3,c3_1,c3_2,c_tr,c4,c14_1,c5,c6,c7,c7_1,c8,c9,c9_1,
						c10,c11,c12,c13,c14,c14_a,c15,c16,c16_1,c17,c17_1,c18,c18_1,
						c_n2o0,c_n2o1,c_n2o2,c_2pIdx012,DR_substi,c1_2,c_cr1,c_cr2;
	wire		above_null_by1_from_left = ((xTbInCUin4)%2==1 && tuSize==2) || (xTbInCUin4%4==2 && (pre_tuSize==3 && order==0))  ;
//	assign				is_topl_sub_s3  = 	bOnlyLeft && (pre_tuSize==2 && ((xTbInCUin4)%2==1)) || (xTbInCUin4%4==2 && (pre_tuSize==3 && !pre_modeHor && order==0)) && !bNull;		
	assign				is_topl_sub_s3  = 	bOnlyLeft &&  above_null_by1_from_left && !bNull && (pre_tuSize==2 || (pre_tuSize==3 && (xTb_gtP ^^ pre_modeHor))) && awkCnt> cnt_by1 && !isChroma;		
	assign				channel_Cr 	=	isChroma && cIdx==2;
	always @ (posedge clk or negedge arst_n) begin
		if(~arst_n)	begin
			r_TL <= 0;
			l1_xTb_gtP <= 0;
			l2_xTb_gtP <= 0;
			l1_pre_tuSize	 <= 0;
			l2_pre_tuSize	 <= 0;
			l3_pre_tuSize	 <= 0;
			l1_pre_modeHor	 <= 0;
			l2_pre_modeHor	 <= 0;
			sub_tl			<=0;
			substi_Opt<=0;
		end
		else if(~rst_n)	begin
			r_TL <= 0;
			l1_xTb_gtP <= 0;
			l2_xTb_gtP <= 0;
			l1_pre_tuSize	 <= 0;
			l2_pre_tuSize	 <= 0;
			l3_pre_tuSize	 <= 0;
			l1_pre_modeHor	 <= 0;
			l2_pre_modeHor	 <= 0;
			sub_tl			<=0;
			substi_Opt <=0;
		end
		else	begin
			if(!bStop) 	begin
				if(order==0)	begin
					r_TL <= data_tl;
				end
				l1_xTb_gtP <= xTb_gtP;		
				l2_xTb_gtP <=l1_xTb_gtP;
				l1_pre_tuSize	 <= pre_tuSize;
				l2_pre_tuSize	 <= l1_pre_tuSize;
				l3_pre_tuSize	 <= l2_pre_tuSize;		
				l1_pre_modeHor	 <= pre_modeHor;
				l2_pre_modeHor	 <= l1_pre_modeHor;		
				sub_tl			<=	temp_tl;
				
				substi_Opt 		 <= {channel_Cr,is_topl_sub_s3,substi_Opt_[0],substi_Opt_[1],substi_Opt_[2],substi_Opt_[3],substi_Opt_[4],substi_Opt_[5],substi_Opt_[6],substi_Opt_[7]};

			end
		end
	end
	
	

	assign      cnt_by3 = 3'd2;		//fix it;
	assign      cnt_by2 = 3'd2;		//fix it;

	
	
	generate
		genvar i,q;
		 for(i=0;i<8;i=i+1)begin: xi
			always @(posedge clk or negedge arst_n)	begin
				if (~arst_n)	
					sub_data[bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i] <= 0;
				else if(~rst_n)
					sub_data[bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i] <= 0;
				else 
					sub_data [bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i] <=  bStop? sub_data [bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i] : sub_srambank[i];
			end
			always @(*) begin		
				posIn4[i]	= i_modiPosIn4[nSRAMs*5-1-5*i:35-5*i];
				srambank[i] = data[bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i];			
				adr[i] = pseuAdr[23-3*i:21-3*i];	
				sub_srambank [i]= {sub_pixel[i][0],sub_pixel[i][1],sub_pixel[i][2],sub_pixel[i][3]};
				if(adr[i][0]==0)
					val_top0 [i]= posIn4[i];				//(((adr[i][2:1]<<5) + (i<<2))>>2)+xTbInCUin4;		
				else 
					val_top0 [i]= 25;
					
				if(adr[i]!=7 && adr[i][0]==1)
					val_left0 [i] = posIn4[i];
				else
					val_left0 [i] = 25;		//25
				
				/*isTpInCB:  It's to show that this TB is in the top of the current CTB, so no substitution. Use the data from SRAM*/
				
				c0[i] =	!isLeft && !isTopLeft && adr[i][0]==1;
				c1[i] = (  adr[i][0]==1 &&    (verLevel[ankor_y] > verLevel[val_left0[i][3:0]] && partIdx == 1) 	 );		//left
				c1_2[i] =  (  adr[i][0]==1 && (partIdx[0]==0 && ((val_left0[i] >= nMaxCBin4 && val_left0[i]!=25)  ||  verLevel[ankor_y] != verLevel[val_left0[i][3:0]])    ) ) ;
				c2[i] = (adr[i][0]==1  && partIdx == 3 &&  ( (val_left0[i] >= nMaxCBin4 && val_left0[i]!=25)     ||  (verLevel[ankor_y] != verLevel[val_left0[i][3:0]]) ) );	//above
				c3[i] = !isAbove && !isTopLeft && isLeft && adr[i][0]==0;
				c3_1[i] = adr[i][0]==1 && isBtBorder && val_left0[i]>=posBtBorderIn4 && val_left0[i]!=25 && partIdx != 1 && isLeft;
				c3_2[i] = adr[i][0]==0 && isRtBorder && val_top0[i]>=posRtBorderIn4 && isAbove;
				c_tr[i] = (adr[i][0]==0  && (  ((horLevel[ankor_x] != horLevel[val_top0[i][3:0]]) && yTbInCU!=0)|| (partIdx==3 && val_top0[i]>= nMaxCBin4 && val_left0[i]!=25) ) ) && !bStop	; // top-right substitution
				
				//bypa 1
				
				c6[i]	= ( (xTb_ltP && pre_modeHor && val_top0 [i] == bypa_pos_1 && bp_f_1 ==0 && !isTpInCB) ) && b03 &&   awkCnt> cnt_by1 ; //#mov: s3;					D		
				c14_1[i] = b03 && xTb_gtP && ( val_left0[i]== bypa_pos_1 && bp_f_1 ==1 &&  !pre_modeHor) && !bNull && awkCnt> cnt_by1 && isChroma==0;		//mov:s3;   nCase6:5-3 D			
			
						
				//bypa 2
				c5[i]	=	(xTb_ltP && b03 && !pre_modeHor && val_top0 [i] == bypa_pos_2 && bp_f_2 ==0 && !isTpInCB) && awkCnt> cnt_by2 ;	//#mod:nCase14:5-2	dw D
				c7[i]   = (xTb_gtP && (pre_modeHor && b03 ) && val_left0 [i] == bypa_pos_2 && bp_f_2 ==1)	&& awkCnt> cnt_by2	;// #mod:nCase5:5-2;  D
				c8[i]	= !l1_xTb_gtP && val_top0 [i] == bypa_pos_2 && bp_f_2 ==0 && b12  && awkCnt> cnt_by2 && !isTpInCB ;		//#mod:nCase4:10-7 D
				c10[i]	= l1_xTb_gtP && val_left0 [i] == bypa_pos_2 && bp_f_2 ==1 && b12  && awkCnt> cnt_by2 ;			//#mod:nCase2:10-7 D
				c11[i]	= ((!l1_xTb_gtP && l1_pre_modeHor && val_top0 [i] == bypa_pos_2 && bp_f_2 ==0 && !isTpInCB)	//cdt11		//#mod: nCase13:6-3 dw D
											|| (l1_xTb_gtP && !l1_pre_modeHor && val_left0[i] == bypa_pos_2 && bp_f_2 ==1)  ) &&  b13 && awkCnt> cnt_by2 ;		//#mod: nCase7: 6-3 dw; D
				c14[i] 	= tuSize ==2 && partIdx ==0 && (val_left0[i]== bypa_pos_2 && bp_f_2 ==1 && (pre_tuSize==3 && pre_modeHor)) && awkCnt> cnt_by2  && !bNull && isChroma==0;  //#mod:nCase5:5-2; dw  D
				
				//bypa 3   
				
				c7_1[i]   = (xTb_gtP &&  b03  && val_left0 [i] == bypa_pos_3 && bp_f_3 ==1)	&& awkCnt> cnt_by3	;//#add:nCase5:5-1;  D
			//	c7_2[i]	= xTb_ltP && val_top0 [i] == bypa_pos_3 && bp_f_3 ==0 && b03 && awkCnt> cnt_by3 &&
			//	c4[i]	= (xTb_ltP && val_top0 [i] == bypa_pos_3 && bp_f_3 ==0 && b02  && awkCnt> cnt_by3 && !isTpInCB) ;		//#mod:nCase4:9-5;					D		
				c4[i]	= (xTb_ltP && val_top0 [i] == bypa_pos_3 && bp_f_3 ==0 && (b02 || pre_tuSize==3)  && awkCnt> cnt_by3 && !isTpInCB) ;		//#mod:nCase4:9-5; nCase14:	5-1				D		
				c12[i]	= l2_pre_tuSize== 2 && !l2_xTb_gtP && val_top0 [i] == bypa_pos_3 && bp_f_3 ==0 && b2  && awkCnt> cnt_by3 && !isTpInCB; //mod:nCase4:11-7	-- D
				c13[i]  = l2_pre_tuSize== 2 && l2_xTb_gtP && val_left0 [i] == bypa_pos_3 && bp_f_3 ==1 && b2  && awkCnt> cnt_by3 ;		//mod:nCase2:11-7;  	-- D
				
					//no existed before
				c9[i] =   b13  &&  val_left0 [i] == bypa_pos_3 && bp_f_3 ==1  && (l1_xTb_gtP && l1_pre_modeHor) &&   awkCnt> cnt_by3;	//nCase:8 6-2;
				c9_1[i] = b13  &&  val_top0 [i]  == bypa_pos_3 && bp_f_3 ==0  && (!l1_pre_modeHor && !l1_xTb_gtP) &&   awkCnt> cnt_by3 && !isTpInCB;	//nCase:14 6-2;
				c17[i]  = b23  && val_left0 [i] == bypa_pos_3 && bp_f_3 ==1  &&  l2_xTb_gtP && !l2_pre_modeHor   && awkCnt> cnt_by3;	//nCase7:7-3
				c17_1[i] = b23  && val_top0 [i]  == bypa_pos_3 && bp_f_3 ==0  &&  !l2_xTb_gtP && l2_pre_modeHor   && awkCnt> cnt_by3 && !isTpInCB;	//nCase13:7-3
				c18[i] = order==0 && pre_tuSize==4 && xTb_gtP && !pre_modeHor && val_left0 [i] == bypa_pos_3 && bp_f_3 ==1 && awkCnt> cnt_by3;
				c18_1[i] = order==0 && pre_tuSize==4 && xTb_ltP && pre_modeHor && val_top0 [i] == bypa_pos_3 && bp_f_3 ==0 && awkCnt> cnt_by3 && !isTpInCB;
				
					//tuSize==2
				c14_a[i] 	= tuSize ==2 && partIdx ==0 && (val_left0[i]== bypa_pos_3 && bp_f_3 ==1 && pre_tuSize==3 ) && !bNull && isChroma==0 && awkCnt> cnt_by3;  //#add:nCase5:5-1;	D	 			
				c15[i]	= tuSize==2 && partIdx== 1 && ((l2_pre_tuSize ==2 || l2_pre_tuSize==3 && l2_pre_modeHor) && val_top0[i] == bypa_pos_3 && bp_f_3 ==0 && !isTpInCB) && awkCnt> cnt_by3 && !bStop && !isChroma;	//#mod:nCase3:11-7   nCase9: 7-3 D
				c16[i]	= val_top0[i]== bypa_pos_3 && bp_f_3 ==0 && awkCnt> cnt_by3 && tuSize==2 && partIdx==2 && !bStop && isChroma==0;			//#mod:  nCase2:5-1	up D
				
				if(isChroma && ((pre_tuSize==2 && cIdx==1 ) || (l2_pre_tuSize[1]==1 && cIdx==2)))	begin
					c_cr1[i] =((xTb_ltP && val_top0[i]== bypa_pos_3 && bp_f_3 ==0 && !isTpInCB)|| 
							(xTb>=pre_xTb && val_left0[i]== bypa_pos_3 && bp_f_3 ==1))  && !bNull ;
				end
				else
					c_cr1[i] = 0;	
				
				if(isChroma && ((l2_pre_tuSize[1]==1 && cIdx==2)))	begin
					c_cr2[i] =((!l2_xTb_gtP && val_top0[i]== bypa_pos_3 && bp_f_3 ==0 && !isTpInCB)|| 
							(l2_xTb_gtP && val_left0[i]== bypa_pos_3 && bp_f_3 ==1))  && !bNull ;
				end
				else
					c_cr2[i] = 0;
				
				//bypa sp
				c16_1[i]  = val_top0[i]== by4_1_forStop_pos   && !bStop && tuSize==2 && partIdx==3;
					
				c_n2o0[i] =  ((   (c6[i]  || c7[i] || c7_1[i] ))  || ( (c4[i] || c5[i]) ) );
			
				c_n2o1[i] = (((c8[i] ||c10[i]) ) || ((c11[i] || c9[i] || c9_1[i]))) ;
				
				c_n2o2[i] = (c12[i] || c13[i] || c17[i] || c17_1[i]);
				
	
				DR_substi[i] = (p3[i] && isChroma) ||c_cr1[i] || c_cr2[i] || ( bNull || c0[i] || c3_1[i] || c3_2[i])|| ((c1[i] || c1_2[i] || c2[i] ) || (c3[i] || c_tr[i] || c14_1[i] || c16_1[i] || c18[i] || c18_1[i]) || ( c15[i]|| c16[i] ||c14[i] || c14_a[i])|| (adr[i]==7) )|| ((tuSize!=2 && !bNull && isChroma==0 && (c_n2o0[i]|| c_n2o1[i] || c_n2o2[i]))) ;
				
				
				p1[i] =((xTb_ltP && val_top0[i]== bypa_pos_1 && bp_f_1 ==0 && !isTpInCB)|| 
							(xTb_gtP && val_left0[i]== bypa_pos_1 && bp_f_1 ==1))  && !bNull ;
			//	p2[i] = (c1[i] == 1'b1  || c2[i] == 1'b1 || (c3[i]== 1'b1 && above_null_by1_from_left) ) && !bNull ;
				p2[i] = c3[i] && above_null_by1_from_left && !bNull && (pre_tuSize==2 || (pre_tuSize==3 && (xTb_gtP ^^ pre_modeHor))) && awkCnt> cnt_by1;
				p3[i] = (c1[i] || c2[i]) && pre_tuSize==2 && !bNull;
				
				substi_Opt_[i] = 0;
				
				if((p1[i] && pre_tuSize[1]==1 ) || (((c6[i] || c14_1[i] ) && tuSize!=2 && !bNull && isChroma==0)))
					substi_Opt_[i] = 1;			//temp_sub[i][q] = bp1_4samp[q];
				else if(p2[i])
					substi_Opt_[i] = 2;			//bp1_4samp[0]
				else if(p3[i])
					substi_Opt_[i] = 3;			//temp_sub[i][q] = bp1_4samp[3];			
				else if((c3_1[i] || c3_2[i]) && pre_tuSize==2 && !isChroma)		//only 4x4
					substi_Opt_[i] = c3_1[i]? 4:5;			//r_b / r_rt
		//		else	
		//			substi_Opt_[i] = 0;
				if(isChroma)
					substi_Opt_[i] = 0;
			end
			for(q=0;q<4;q=q+1) begin: xq  //idx of pixel in chip[p]
				always @(*) begin	
				
					pixel_SRAM[i][q] =  srambank[i][SRAMDW-1-bitDepth*q:SRAMDW-bitDepth*(q+1)];		
					temp_sub[i][q] = 0; 
					if(bNull)	begin
						temp_sub[i][q] = halfVal; 
					end
					else if(c3[i]) begin			//		cdt3
						temp_sub[i][q] = r_t;								
					end
					else if (c0[i])	begin		//cdt0;
						temp_sub[i][q] = r_l;								
					end
					else if(c3_1[i]) begin
						temp_sub[i][q] = r_b;
					end
					else if(c3_2[i]) begin
						temp_sub[i][q] = r_rt;
					end
					else if (c_tr[i])      // top-right substitution
						if(yTbInCUin4%8==0)
							temp_sub[i][q] = r_br01_32;
						else if(yTbInCUin4%4==0)
							temp_sub[i][q] = r_br01_16;
						else if(yTbInCUin4%2==0)	
							temp_sub[i][q] = r_br01_8;
						else 
							temp_sub[i][q] = r_br01_4;
					else if (c1[i] && tuSize!=2)	//cdt1
						case (tuSize)
					//	3'd2 : temp_sub[i][q] = 0;
						3'd3 : temp_sub[i][q] = r_br01_8;
						3'd4 : temp_sub[i][q] = r_br01_16;
						default : temp_sub[i][q] = r_br01_32;
						endcase
					else if(c1_2[i])begin
						if(partIdx[1]==1)	begin
							if(yTbin4PlusnTBin4%16==0 && xTbInCUin4%16==0)
								temp_sub[i][q] = r_br01_64;
							else if((yTbin4PlusnTBin4)%8==0 && xTbInCUin4%8==0)
								temp_sub[i][q] = ((yTbin4PlusnTBin4>>3)%2==0)?r_br2_32:r_br01_32;
							else if((yTbin4PlusnTBin4)%4==0 && xTbInCUin4%4==0)
								temp_sub[i][q] = ((yTbin4PlusnTBin4>>2)%2==0)?r_br2_16:r_br01_16;
							else if((yTbin4PlusnTBin4)%2==0 && xTbInCUin4%2==0)
								temp_sub[i][q] = ((yTbin4PlusnTBin4>>1)%2==0)?r_br2_8:r_br01_8;
						end
						else begin
							if(yTbin4Plusn2TBin4%16==0 && xTbInCUin4%16==0)
								temp_sub[i][q] = r_br01_64;
							else if((yTbin4Plusn2TBin4)%8==0 && xTbInCUin4%8==0)
								temp_sub[i][q] = ((yTbin4Plusn2TBin4>>3)%2==0)?r_br2_32:r_br01_32;
							else if((yTbin4Plusn2TBin4)%4==0 && xTbInCUin4%4==0)
								temp_sub[i][q] = ((yTbin4Plusn2TBin4>>2)%2==0)?r_br2_16:r_br01_16;
							else if((yTbin4Plusn2TBin4)%2==0 && xTbInCUin4%2==0)
								temp_sub[i][q] = ((yTbin4Plusn2TBin4>>1)%2==0)?r_br2_8:r_br01_8;
						end
					end	
					else if(c2[i] && tuSize!=2) //cdt2
						case (tuSize)
						3'd3 : temp_sub[i][q] = r_br2_8;
						3'd4 : temp_sub[i][q] = r_br2_16;
						default : temp_sub[i][q] = r_br2_32;
						endcase
					
					
					
					/* <<<< substitution when previous TB is 4x4 or 8x8,  so read the data from bypassing 2,3 registers*/
					if((c5[i] || c7[i] || c8[i] || c10[i] || c11[i] || c14[i]) && !bNull && isChroma==0)
						temp_sub[i][q] = bp2_4samp[q];
					if((  c4[i] || c7_1[i]  || c12[i] || c13[i] || c14_a[i] || c15[i] ||  c9[i] || c9_1[i] ||  c17[i] || c17_1[i] || c18[i] || c18_1[i]) && !bNull && isChroma==0 || c16[i] || c_cr1[i] || c_cr2[i] )		//cdt7
						temp_sub[i][q] = bp3_4samp[q];							
					if(c16_1[i])	
						temp_sub[i][q] = bp_stop_4samp[q];	
					if(isChroma && p3[i] && tuSize==2)
						temp_sub[i][q] = bp3_4samp[3];
					/* substitution when previous TB is 4x4 or 8x8,  so read the data from bypassing 2,3 registers  >>>> */
									
						
					if(DR_substi[i])
						sub_pixel[i][q] = temp_sub[i][q];
					else	
						sub_pixel[i][q]=  pixel_SRAM[i][q];	
						
					
				end
			end
		end
	endgenerate
	
	

endmodule

