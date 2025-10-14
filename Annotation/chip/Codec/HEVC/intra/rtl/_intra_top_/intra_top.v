`timescale 1ns/1ps


module intra_top(
	  clk,
	  arst_n,
	  rst_n,
	  mode,
	  pic_width_in_luma_samples,
	  pic_height_in_luma_samples,
	  first_ctu_in_slice_x,
	  first_ctu_in_slice_y,
	  first_ctu_in_tile_x,
	  first_ctu_in_tile_y,
	  last_ctu_in_tile_x,
	  last_ctu_in_tile_y,
	  xCtb,					//Coordinate x, y of CTB upper-left pixel >> 4
	  yCtb,
	  xTb_rela,				//Coordinate x, y of TB in CTB upper-left pixel >> 2
	  yTb_rela,
	residuals     //i
	,predSamples_inter
	,r_reconSamples    //o
	,tuSizeLog2
	,nMaxCUlog2
	,intra_cuPredMode
	,isPcm
	,resi_val
	,resi_rdy
	,cabad_intra_val			//i
	,cabad_intra_rdy			//o
	,inter_pred_rdy
	,inter_pred_val
	,gp_bitDepth
);

	parameter isChroma = 0;
	parameter bitDepthY = 4'd10;
	parameter bitDepthYplus1 = bitDepthY+1;
	parameter nSRAMs 		=8;
	parameter MAINREF_DW = bitDepthY*8;   // 8bits x 8 pixels
	parameter AW = 3;
	parameter realAW_Y = 8;
	parameter realAW_TL_Y = 11;
	parameter ANG_BDEPTH = bitDepthY+5;
	parameter PLA_2_BDEPTH = bitDepthY+3;

	parameter SRAMDW = bitDepthY*4;

	
	/*<<<< 0th stage parameter  */
	
	input 	[8:0]					xCtb,yCtb;  
	input 	[3:0]					xTb_rela,yTb_rela;
	input 							clk,rst_n,arst_n; 
	input	[13:0]					pic_width_in_luma_samples;
	input	[12:0]					pic_height_in_luma_samples;
	input   [8:0]           		first_ctu_in_slice_x;
	input   [8:0]           		first_ctu_in_slice_y;
	input   [8:0]          			first_ctu_in_tile_x;
	input   [8:0]           		first_ctu_in_tile_y;
	input   [8:0]           		last_ctu_in_tile_x;
	input   [8:0]           		last_ctu_in_tile_y;
	
	input 	[2:0] 					nMaxCUlog2;
	input 	[5:0]					mode;
	input 	[2:0] 					tuSizeLog2;
	input 	[(bitDepthY+1)*16-1:0] 	residuals;
	input							cabad_intra_val;
	input							isPcm;
	input	[1:0]					intra_cuPredMode;
	input						 	resi_val;
	input 	[bitDepthY*16-1:0]		predSamples_inter;
	input							inter_pred_val;
	
	input	[3:0]					gp_bitDepth;
	
	output reg						resi_rdy; 
	output reg [bitDepthY*16-1:0] 	r_reconSamples;	
	output 							cabad_intra_rdy;
	output 							inter_pred_rdy;
	
	reg 	[8:0]					xCtb_,yCtb_;  
	reg  	[3:0]					xTb_rela_,yTb_rela_;
	reg 	[5:0]					mode_;
	reg 	[2:0] 					tuSizeLog2_;
	reg								isInter;
	
	wire	[2:0]					nMaxCblog2;
	wire 	[12:0] 					yTb;		//input
	wire 	[12:0] 					xTb;		//input
	wire 	[2:0] 					X,Y;
	wire 	[3:0] 					preStage;
	wire 	[AW*8-1:0] 				pseuAdr;

	wire							isLastCycInTb;
	wire	[2:0]					order;
	
	wire	[1:0]					cIdx;
	wire 	[2:0] 					tuSize;
	/* 0th stage parameter  >>>>*/
	
	// z stage
	
	reg 	[2:0] 					lz_X,lz_Y;
	reg 	[5:0]					lz_mode;
	reg 	[2:0] 					lz_tuSize;
	reg 	[12:0] 					lz_xTb;		
	reg 	[12:0] 					lz_yTb;		
	reg 	[3:0] 					lz_preStage;
	reg								lz_isLastCycInTb;
	
	reg		[2:0]					lz_order;
	reg     [AW*8-1:0] 				lz_pseuAdr;
	
	reg		[1:0]					lz_cIdx;
	reg								lz_isInter;
	
	wire	[15:0]					horFlag,verFlag;
	wire 	[63:0] 					verLevel;
	wire 	[63:0] 					horLevel;
	wire	[5:0]					lz_RtBorderInfo;
	wire	[5:0]					lz_BtBorderInfo;
	wire							lz_isLtBorder;
	wire							lz_isAbove,lz_isLeft,lz_isTopLeft;
	wire							lz_isFirstCycInTb;
	wire		[1:0]				lz_partIdx;
	wire 	[realAW_TL_Y-1:0]   	r_addr_TL_;
	wire 	[realAW_Y*8-1:0]	   	r_addr_;
	wire 	[8:0]  					rE_n_;
	reg 	[8:0]  					rE_n_tmp;
	// z stage ends
	
	
	/*<<<< 1st stage parameter  */
	wire 	[AW*8-1:0] 				l0_pseuAdr;
	wire    [nSRAMs*5-1:0]			l0_modiPosIn4;
	wire 	[nSRAMs*3-1:0]			l0_ram_idx;
	
	reg 	[2:0] 					l0_X,l0_Y;
	reg								l0_isAbove,l0_isLeft,l0_isTopLeft;
	reg 	[5:0]					l0_mode;
	reg 	[2:0] 					l0_tuSize;
	reg 	[12:0] 					l0_xTb;		
	reg 	[12:0] 					l0_yTb;		
	reg 	[3:0] 					l0_preStage;
	reg								l0_isLastCycInTb;
	reg		[1:0]					l0_partIdx;
	reg 	[63:0] 					l0_verLevel;
	reg 	[63:0] 					l0_horLevel;
	reg		[15:0]					l0_horFlag,l0_verFlag;
	reg								l0_isFirstCycInTb;
	reg		[2:0]					l0_order;
	reg						 		l0_isLtBorder;
	reg		[5:0]					l0_BtBorderInfo;
	reg		[5:0]					l0_RtBorderInfo;	
	
	reg 	[realAW_TL_Y-1:0]   	r_addr_TL;
	reg 	[realAW_Y*8-1:0]	   	r_addr;
	reg 	[8:0]  					rE_n;	
	reg		[1:0]					l0_cIdx;
	reg								l0_isInter;
	/* 1st stage parameter  >>>>*/
	
	
	/*<<<< 2nd stage parameter  */
	
	wire 	[SRAMDW*8-1:0] 			r_data;
	wire	[bitDepthY-1:0]			top_left_pixel;
	wire 	[47:0] 					ref_pos;
	wire 	[15:0] 					ref_TLADflag;
	wire 	[5:0]					bp_pos_1,bp_pos_2,bp_pos_3;
	wire	[3*nSRAMs+1:0]			substi_Opt;
	wire 	[bitDepthY-1:0] 		sub_top_left_pixel;
	wire	[SRAMDW*8-1:0]			sub_data;
	
	wire [6:0]      				l_xTbInCU ,l_yTbInCU;
	reg 	[nSRAMs*3-1:0]			l_ram_idx;
	wire	[2:0]					l_awkCnt;
		
	reg     [nSRAMs*5-1:0]			l_modiPosIn4;	
	reg 	[2:0] 					l_X,l_Y;
	reg								l_isAbove,l_isLeft,l_isTopLeft;
	reg 	[5:0]					l_mode;
	reg 	[2:0] 					l_tuSize;
	reg 	[12:0] 					l_xTb;		
	reg 	[12:0] 					l_yTb;		
	reg 	[3:0] 					l_preStage;
	reg								l_isLastCycInTb;
	reg 	[AW*8-1:0] 				l_pseuAdr;
	reg		[1:0]					l_partIdx;
	reg 	[63:0] 					l_verLevel;
	reg 	[63:0] 					l_horLevel;
	reg		[15:0]					l_horFlag,l_verFlag;
	reg								l_isFirstCycInTb;
	reg		[2:0]					l_order;
	reg						 		l_isLtBorder;
	reg		[5:0]					l_BtBorderInfo;
	reg		[5:0]					l_RtBorderInfo;
	reg		[1:0]					l_cIdx;
	reg								l_isInter;
	wire 							l_modeHor;
	wire	[2:0] 					l_X_tr,l_Y_tr;			//X,Y after transpose

	wire 	[11:0] 					move;
	wire	[19:0] 					weight;
	/* 2nd stage parameter  >>>>*/
	
	
	/*<<<< l1 stage parameter*/
	reg 							l1_modeHor;
	reg 	[5:0]					l1_mode;		
	reg 	[2:0] 					l1_X,l1_Y;
	reg 	[12:0] 					l1_xTb;	
	reg 	[12:0] 					l1_yTb;		
	reg 	[47:0] 					l1_ref_pos;
	reg 	[15:0] 					l1_ref_TLADflag;
	reg 	[3:0] 					l1_preStage;	 
	reg								l1_isLastCycInTb;
	reg		[2:0]					l1_tuSize;
	reg		[1:0]					l1_partIdx;
	reg		[15:0]					l1_horFlag;
	reg		[15:0]					l1_verFlag;
	reg								l1_isFirstCycInTb;
	reg		[2:0]					l1_order;
	reg 	[nSRAMs*3-1:0]			l1_ram_idx;
	reg						 		l1_isLtBorder;
	reg		[5:0]					l1_BtBorderInfo;
	reg		[5:0]					l1_RtBorderInfo; 
	reg		[1:0]					l1_cIdx;
	reg		[12:0]					l1_xTb_cr;	
	reg  	[2:0]					l1_tuSize_cr;
	reg								l1_isInter;	 

	wire	[3*24-1:0]				idx_mapped_;
	wire	[53:0]					l1_options;
	wire 	[MAINREF_DW-1:0]		l1_mainRefReg;
	wire	[bitDepthY-1:0] 		l1_unFilDC;
	wire 	[bitDepthY-1:0] 		l1_top_right_pixel,l1_bottom_left_pixel;
	wire 	[bitDepthY-1:0] 		l1_sub_top_left_pixel_P;
	wire		[2:0]				l1_opt_recon;
	reg		[2:0] 					l1_X_tr,l1_Y_tr;			//X,Y after transpose
	wire	[1:0]					l1_unFil_opt;
	
	/* l1 stage parameter  >>>>*/
	
	/*<<<< l2 stage parameter*/


	wire 	signed [6:0] 			angle;
	wire 	[4:0] 					ang;     //simplified version of angle 
 
	reg 							l2_modeHor;
	wire 	[bitDepthY*4-1:0] 		byPa_P_DR_1;
	wire 	[bitDepthY*4-1:0] 		byPa_P_DR_1_cr;
	wire 	[bitDepthY*16-1:0] 		byPa_P_A_2;
	wire 	[bitDepthY*11-1:0]		byPa_P_A_2_cr;
	wire 	[bitDepthY*6-1:0] 		byPa_DW_A_3;
	wire   [bitDepthY*2-1:0] 		btRtSamples;

	reg 	[19:0] 					l2_weight;

	wire 							l2_isPredFilter;
	wire 	[bitDepthY*16-1:0] 		predSamples;		
	reg	[2:0] 						l2_X_tr,l2_Y_tr;			//X,Y after transpose
	wire 	[SRAMDW*8-1:0] 			sub_data_P;

	wire 	[bitDepthY*4-1:0] 		by4_1_forStop;
	wire 	[bitDepthY*4-1:0] 		by4_1_forStop_cr;
	wire	[4:0]					by4_1_forStop_pos;
	 
	wire 	[realAW_TL_Y-1:0]   	w_addr_TL_;
	wire 	[realAW_Y*8-1:0]	   	w_addr_;
	wire 	[bitDepthY-1:0]    		w_data_TL_;
	wire 	[SRAMDW*8-1:0] 			w_data_;
	wire 	[8:0]  					wE_n_;
	wire    [bitDepthY*16-1:0] 		reconSamples;	
	wire    						bDelayWrite;
	 
	 	 
	reg 	[2:0] 					l2_X,l2_Y;
	reg 	[12:0] 					l2_xTb;	
	reg 	[12:0] 					l2_yTb;		
	reg 	[5:0] 					l2_mode; 
	reg 	[3:0] 					l2_preStage;	 
	reg								l2_isLastCycInTb;
	reg		[2:0]					l2_tuSize;
	reg		[1:0]					l2_partIdx;
	reg		[15:0]					l2_horFlag;
	reg		[15:0]					l2_verFlag;
	reg								l2_isFirstCycInTb;
	reg		[2:0]					l2_order;
	reg						 		l2_isLtBorder;
	reg		[5:0]					l2_BtBorderInfo;
	reg		[5:0]					l2_RtBorderInfo; 
	reg		[1:0]					l2_cIdx;
	reg								l2_isInter;	 
	 
	reg 	[11:0] 					l2_move;
	reg		[2:0]					l2_opt_recon;
	
	reg 	[MAINREF_DW-1:0]		l2_mainRefReg;
	reg		[bitDepthY-1:0] 		l2_unFilDC;
	reg 	[bitDepthY-1:0] 		l2_top_right_pixel,l2_bottom_left_pixel;
	reg 	[bitDepthY-1:0] 		l2_sub_top_left_pixel_P;
	reg	    [1:0]					l2_unFil_opt;
	reg 	[(bitDepthY+3)*2-1:0] 	l2_DC_xxxx_data;
	//wire [(bitDepthY+1)*16-1:0]		r_r0,r_r1,r_r0_,r_r1_;	
	wire [(bitDepthY+1)*16-1:0]		r_r0,r_r1;	
//	wire [ANG_BDEPTH*16-1:0]		r_ang_0,r_ang_1;	
	wire [(bitDepthY+4)*16-1:0]		r_plan_0;	
	wire [(bitDepthY+4)*16-1:0]		r_plan_1;	
	wire [(PLA_2_BDEPTH)*16-1:0]	r_plan_2;	
	wire [(PLA_2_BDEPTH)*16-1:0]	r_plan_3;	
	wire [(bitDepthY+3)*2-1:0] 		l1_DC_xxxx_data;
	
		
	wire [3*8-1:0]					opt_w;
	wire [2:0]						opt_w_tl;	
	wire [4:0]						w_TL_rela_;
	/* 3rd stage parameter >>>>*/
	
	/*<<<< 4th stage parameter*/
	
	reg 	[realAW_TL_Y-1:0]   	w_addr_TL;
	reg 	[realAW_Y*8-1:0]	   	w_addr;
	reg 	[bitDepthY-1:0]    		w_data_TL;
	reg 	[SRAMDW*8-1:0] 			w_data;
	reg 	[8:0]  					wE_n;
	reg		[2:0]					l3_tuSize;
	reg		[1:0]					l3_cIdx;
	
	/* 4th stage parameter >>>>*/
		
	assign      nMaxCblog2 = !isChroma? nMaxCUlog2:(nMaxCUlog2-1);
	assign      l_xTbInCU = l_xTb%(1<<nMaxCblog2);
	assign 		l_yTbInCU = l_yTb%(1<<nMaxCblog2);
	
	assign 		l2_isPredFilter =    (l2_tuSize >3'd4 || isChroma) ? 1'b0 : 1'b1;
		
	assign      lz_isFirstCycInTb  = (lz_order == 0);
	   
	assign 		l_modeHor = l_mode < 18 && l_mode>1 ;
	
	assign 		isLastCycInTb = (tuSize==2 && preStage<2)?1:((order==7)?1:0);
	

	wire      	bStop_z,bStop_0,bStop_1,bStop_1_1,bStop_2,bStop_3;	
	wire      	bStopz,bStop0,bStop1,bStop1_1,bStop2,bStop3;
	wire      	bStop;

	always @(posedge clk or negedge arst_n) begin
		if(!arst_n)
			{resi_rdy} <= 0 ;
		else if(!rst_n)
			{resi_rdy} <= 0 ;
		else 	begin
			if(!bStop_2)
				resi_rdy <= !bStop1_1 && l1_preStage[3] ;
		end
		
	end
	
	assign      inter_pred_rdy = l2_isInter && resi_rdy && !bStop2;
	
	reg		[2:0]					cnt;
	reg								flag;
	
	wire		isLast32In64_inter = (cnt==3 || flag);
	wire 		flag_1 = (isLastCycInTb && cIdx[0]==0 && !flag && cnt!=3);
	wire 	[2:0]					cnt_ = cnt+1;				
	wire 	[2:0]     				p_tuSize ;
	wire	[12:0] 					p_xTb ;
	

	assign	p_tuSize	= {l1_cIdx,l_cIdx}=={4'b0110}? l1_tuSize_cr: l1_tuSize; 
	assign	p_xTb		=   {l1_cIdx,l_cIdx}=={4'b0110}? l1_xTb_cr : l1_xTb ;
	
	
	always @(posedge clk or negedge arst_n)  begin
	  if(!arst_n) begin
		{isInter,xCtb_,yCtb_,tuSizeLog2_,xTb_rela_,yTb_rela_,mode_} <= 0;
		cnt <= 0;
		flag <= 1;
		end
	  else if(!rst_n)	begin
		{isInter,xCtb_,yCtb_,tuSizeLog2_,xTb_rela_,yTb_rela_,mode_} <= 0;
		cnt <= 0;
		flag <= 1; 
		end
	  else begin
			
			if(tuSizeLog2!=6 && !flag_1 && (cabad_intra_rdy && cabad_intra_val)) begin
				isInter      <= ~intra_cuPredMode[0];
				xCtb_        <= xCtb;
				yCtb_        <= yCtb;
				tuSizeLog2_  <= tuSizeLog2;
				mode_        <= mode;
			end 
			else if((cabad_intra_rdy && cabad_intra_val && tuSizeLog2==6) && !flag_1) begin
				isInter      <= ~intra_cuPredMode[0];
				tuSizeLog2_  <= 5;
				xCtb_        <= xCtb;
				yCtb_        <= yCtb;
			end
			
			if(!flag_1 && (cabad_intra_rdy && cabad_intra_val)) begin
				xTb_rela_    <= xTb_rela;
				yTb_rela_    <= yTb_rela;
			end
			else if(flag_1 && !bStop)	begin
				xTb_rela_    <= ((cnt_[0])<<3);
				yTb_rela_    <= ((cnt_[1])<<3);
			end
			
			if(cabad_intra_rdy && cabad_intra_val) begin
				flag 			<= (tuSizeLog2!=6 )? 1: 0;
				end
			if(!bStop) begin
				if(flag_1)
					cnt			<= (cnt +1);
				else if(isLastCycInTb && cIdx[0]==0)
					cnt			<= 0;
			end
			
	    end
	end
	

	
intra_stopCtrl cStopCtrl(
		.clk(clk)
		,.rst_n(rst_n)
		,.arst_n(arst_n)
		
		,.l_awkCnt(l_awkCnt)
		,.resi_val(resi_val)
		,.cabad_intra_val(cabad_intra_val)
		,.isLastCycInTb(isLastCycInTb)
		,.cIdx(cIdx[0])
		,.isLast32In64_inter(isLast32In64_inter)
		
		,.bStop(bStop)
		,.bStop_z(bStop_z)
		,.bStop_0(bStop_0)
		,.bStop_1(bStop_1)
		,.bStop_1_1(bStop_1_1)
		,.bStop_2(bStop_2)
		,.bStop_3(bStop_3)
		,.bStopz(bStopz)
		,.bStop0(bStop0)
		,.bStop1(bStop1)
		,.bStop1_1(bStop1_1)
		,.bStop2(bStop2)
		,.bStop3(bStop3)
		,.cabad_intra_rdy(cabad_intra_rdy)
	);
	
 		 always @(posedge clk or negedge arst_n) begin
			 if(~arst_n)	begin
				 {lz_tuSize,lz_mode,lz_X,lz_Y,lz_xTb,lz_yTb, 
				 lz_isLastCycInTb,lz_order,lz_preStage,lz_pseuAdr} <= 0;	
				 lz_cIdx <= 3;
			 
				 {l0_tuSize,l0_mode,l0_isAbove,l0_isLeft,l0_isTopLeft, l0_X,l0_Y,l0_xTb,l0_yTb, 
				 l0_partIdx,l0_verLevel,l0_horLevel,l0_horFlag,l0_verFlag,l0_isLastCycInTb,l0_isFirstCycInTb,
				 l0_order,l0_isLtBorder,l0_BtBorderInfo,l0_RtBorderInfo,l0_preStage} <= 0;	
				 l0_cIdx <= 3;
						 
				 l_tuSize <= 0;
				 l_mode <=  0;
				 l2_mode <=  0;
				 l_X <=  0;
				 l_Y <=  0;
				 l_xTb <= 0;
				 l_yTb <= 0;	
				 l_partIdx <= 0;
				 l_verLevel <= 0;
				 l_horLevel <= 0;
				 l_horFlag <= 0;
				 l_verFlag <= 0;
				 l_isLastCycInTb <= 0;
				 l_isFirstCycInTb <= 0;
				 l_order 	<= 0;
				 l2_order	<= 0;
				 r_reconSamples<=0;
				 l_isLtBorder <= 0;
				 l_isAbove <=0;
				 l_isLeft <= 0;
				 l_isTopLeft <=0;
				 l_BtBorderInfo <=0;
				 l2_BtBorderInfo <=0;
				 l_RtBorderInfo <=0;
				 l2_RtBorderInfo <=0;
				 l_pseuAdr  <= 0;
				 l_modiPosIn4 <=0;
				 l_ram_idx <=0;
				  
				 r_addr_TL <= 0;
				 r_addr <= 0;
				
				 l_cIdx <= 3;
				 
				 // l1 stage
				 {l1_mode,l1_tuSize,l1_ref_pos,l1_ref_TLADflag,l1_X,l1_Y,l1_xTb,l1_yTb,l1_partIdx,l1_isLastCycInTb,
				l1_preStage,l1_horFlag,l1_verFlag,l1_isFirstCycInTb,l1_order,l1_ram_idx,l1_isLtBorder,l1_BtBorderInfo,
				l1_RtBorderInfo,l1_modeHor,l1_isInter}<= 0; 
				 l1_cIdx <= 3;
				  {l1_X_tr,l1_Y_tr} <= 0;
				  
				  //	l2 stage	 
				 l2_tuSize <= 0;
				 l2_X <=  0;
				 l2_Y <=  0; 
				 l2_xTb <= 0;
				 l2_yTb <= 0;	
				 l2_partIdx <= 0;
				 l2_isLastCycInTb <= 0;
				 

				 l_preStage <= 0;
				 l2_preStage <=0;
				 l2_horFlag <= 0;
				 l2_verFlag <= 0;
				 l2_isFirstCycInTb <= 0;
				 l2_isLtBorder <= 0;
				 l2_cIdx <= 3;				 
				 l1_xTb_cr <= 0;
				 l1_tuSize_cr <=0; 
				 l2_modeHor <= 0;
				 {l2_move,l2_weight} <=0;
				 {l2_X_tr,l2_Y_tr} <= 0;
				 l2_unFil_opt	<=	0;
				 l2_DC_xxxx_data <=	0;
				 //	3rd stage ~ 4th stage
				 l3_tuSize <= 0;
				 l3_cIdx <= 3;
				 
				 w_addr_TL <= 0;
				 w_addr <= 0;
				 w_data_TL <= 0;
				 w_data <= 0;
				 wE_n <= {9'b111111111};
				 
				 {l0_isInter,l_isInter,l2_isInter} <= 0;
			 end 
			 else if(~rst_n)	begin
				 {lz_tuSize,lz_mode,lz_X,lz_Y,lz_xTb,lz_yTb, 
				 lz_isLastCycInTb,lz_order,lz_preStage,lz_pseuAdr} <= 0;	
				 lz_cIdx <= 3;
				 
				 {l0_tuSize,l0_mode,l0_isAbove,l0_isLeft,l0_isTopLeft, l0_X,l0_Y,l0_xTb,l0_yTb, 
				 l0_partIdx,l0_verLevel,l0_horLevel,l0_horFlag,l0_verFlag,l0_isLastCycInTb,l0_isFirstCycInTb,
				 l0_order,l0_isLtBorder,l0_BtBorderInfo,l0_RtBorderInfo,l0_preStage} <= 0;	
				 l0_cIdx <= 3;
				
				 l_tuSize <= 0;
				 l_mode <=  0;
				 
				 l_X <=  0;
				 l_Y <=  0;
				 l_xTb <= 0;
				 l_yTb <= 0;	
				 l_partIdx <= 0;
				 l_verLevel <= 0;
				 l_horLevel <= 0;
				 l_horFlag <= 0;
				 l_verFlag <= 0;
				 l_isLastCycInTb <= 0;
				 l_isFirstCycInTb <= 0;
				 l_isAbove <=0;
				 l_isLeft <= 0;
				 l_isTopLeft <=0;
				 l_order 	<= 0;
				 l_isLtBorder <= 0;
				 
				 l_BtBorderInfo <=0;
				 l_RtBorderInfo <=0;

				 l_pseuAdr  <= 0;
				 l_modiPosIn4 <=0;
				 l_preStage <= 0;
				 l_ram_idx <=0;
				 
				 r_addr_TL <= 0;
				 r_addr <= 0;
				 l_cIdx <= 3;
				 
				 
				 //l1 stage
				{l1_mode,l1_tuSize,l1_ref_pos,l1_ref_TLADflag,l1_X,l1_Y,l1_xTb,l1_yTb,l1_partIdx,l1_isLastCycInTb,
				l1_preStage,l1_horFlag,l1_verFlag,l1_isFirstCycInTb,l1_order,l1_ram_idx,l1_isLtBorder,l1_BtBorderInfo,
				l1_RtBorderInfo,l1_modeHor,l1_isInter}<= 0; 
				 l1_cIdx <= 3;
				 {l1_X_tr,l1_Y_tr} <= 0;
				 
				 //	l2 stage

				 l2_tuSize <= 0;
				 l2_mode <=  0;
				 l2_order	<= 0;
				 l2_X <=  0;
				 l2_Y <=  0; 
				 l2_xTb <= 0;
				 l2_yTb <= 0;	
				 l2_partIdx <= 0;
				 l2_isLastCycInTb <= 0;
				 {l2_X_tr,l2_Y_tr} <= 0;

				 l2_BtBorderInfo <=0;		
				 l2_RtBorderInfo <=0;	
				 l2_preStage <=0;
				 l2_horFlag <= 0;
				 l2_verFlag <= 0;
				 l2_isFirstCycInTb <= 0;
				 l2_isLtBorder <= 0;
				 l2_cIdx <= 3;
				 l1_xTb_cr <= 0;
				 l1_tuSize_cr <=0; 
				 l2_modeHor <= 0;
				 {l2_move,l2_weight} <=0;
				 l2_unFil_opt	<=	0;
				 l2_DC_xxxx_data <=	0;
				 
				 //	3rd stage ~ 4th stage
				 l3_tuSize <= 0;
				 l3_cIdx <= 3;
				 r_reconSamples<=0;
				 
				 w_addr_TL <= 0;
				 w_addr <= 0;
				 w_data_TL <= 0;
				 w_data <= 0;
				 wE_n <= {9'b111111111};
				
				
				{l0_isInter,l_isInter,l2_isInter} <= 0;
			 end
			 else begin
				if(!bStop_z)	begin
					 lz_tuSize <= tuSize;
					 lz_mode <=  mode_;
					 lz_X <=  X;
					 lz_Y <=  Y;
					 lz_xTb <= xTb;
					 lz_yTb <= yTb;	
					 lz_pseuAdr <= pseuAdr;
					 lz_isLastCycInTb <= isLastCycInTb;
					 lz_order 	<= order;
					 lz_preStage <= preStage;
					 lz_cIdx <= cIdx;
					 {lz_isInter} <= {isInter};
				end
				if(!bStop_0)	begin
					 l0_tuSize <= lz_tuSize;
					 l0_mode <=  lz_mode;
					 l0_isAbove <=lz_isAbove;
					 l0_isLeft <= lz_isLeft;
					 l0_isTopLeft <=lz_isTopLeft;
					 l0_X <=  lz_X;
					 l0_Y <=  lz_Y;
					 l0_xTb <= lz_xTb;
					 l0_yTb <= lz_yTb;	
					 l0_partIdx <= lz_partIdx;
					 l0_verLevel <= verLevel;
					 l0_horLevel <= horLevel;
					 l0_horFlag <= horFlag;
					 l0_verFlag <= verFlag;
					 l0_isLastCycInTb <= lz_isLastCycInTb;
					 l0_isFirstCycInTb <= lz_isFirstCycInTb;
					 l0_order 	<= lz_order;
					 l0_isLtBorder <= lz_isLtBorder;
					 l0_BtBorderInfo <= lz_BtBorderInfo;
					 l0_RtBorderInfo <=lz_RtBorderInfo;
					 l0_preStage <= lz_preStage;
					 r_addr_TL <= r_addr_TL_;
					 r_addr <= r_addr_;
					 l0_cIdx <= lz_cIdx;
					 {l0_isInter} <= {lz_isInter};
				end
				if(!bStop_1)	begin
					 l_tuSize <= l0_tuSize;
					 l_mode <=  l0_mode;
					 l_isAbove <=l0_isAbove;
					 l_isLeft <= l0_isLeft;
					 l_isTopLeft <=l0_isTopLeft;
					 l_X <=  l0_X;
					 l_Y <=  l0_Y;
					 l_xTb <= l0_xTb;
					 l_yTb <= l0_yTb;	
					 l_partIdx <= l0_partIdx;
					 l_verLevel <= l0_verLevel;
					 l_horLevel <= l0_horLevel;
					 l_horFlag <= l0_horFlag;
					 l_verFlag <= l0_verFlag;
					 l_isLastCycInTb <= l0_isLastCycInTb;
					 l_isFirstCycInTb <= l0_isFirstCycInTb;
					 l_order 	<= l0_order;
					 l_isLtBorder <= l0_isLtBorder;
					 l_BtBorderInfo <= l0_BtBorderInfo;
					 l_RtBorderInfo <=l0_RtBorderInfo;
					 l_preStage <= l0_preStage;
					 l_pseuAdr  <= l0_pseuAdr;
					 l_modiPosIn4 <=l0_modiPosIn4;
					 l_ram_idx <= l0_ram_idx;
					 l_cIdx <= l0_cIdx;
					 {l_isInter} <= {l0_isInter};
				end
				if(!bStop_1_1)	begin
					l1_mode <=  l_mode;
					l1_ref_pos <= ref_pos;
					l1_ref_TLADflag <= ref_TLADflag; 
					l1_tuSize <= l_tuSize;
					l1_X <=  l_X;
					l1_Y <=  l_Y; 
					l1_xTb <= l_xTb;
					l1_yTb <= l_yTb;	
					l1_partIdx <= l_partIdx;
					l1_isLastCycInTb <= l_isLastCycInTb;
					{l1_X_tr,l1_Y_tr} <=  {l_X_tr,l_Y_tr};

					l1_preStage <=l_preStage;
					l1_horFlag <= l_horFlag;
					l1_verFlag <= l_verFlag;
					l1_isFirstCycInTb <= l_isFirstCycInTb;
					l1_order	<= l_order;
					l1_ram_idx <= l_ram_idx;
					l1_isLtBorder <= l_isLtBorder;
					l1_BtBorderInfo <= l_BtBorderInfo;	

					l1_RtBorderInfo <=l_RtBorderInfo;

					l1_cIdx <= l_cIdx;
					l1_modeHor <= l_modeHor;
					{l1_isInter} <= {l_isInter};
				end
				
				
				if(!bStop_2)	begin
					 //	2nd stage ~ 3rd stage	
					 l2_mode <=  l1_mode;
					 l2_tuSize <= l1_tuSize;
					 l2_X <=  l1_X;
					 l2_Y <=  l1_Y; 
					 l2_xTb <= l1_xTb;
					 l2_yTb <= l1_yTb;	
					 l2_partIdx <= l1_partIdx;
					 l2_isLastCycInTb <= l1_isLastCycInTb;
					 {l2_X_tr,l2_Y_tr} <=  {l1_X_tr,l1_Y_tr};

					 l2_preStage <= l1_preStage;
					 l2_horFlag <= l1_horFlag;
					 l2_verFlag <= l1_verFlag;
					 l2_isFirstCycInTb <= l1_isFirstCycInTb;
					 l2_order	<= l1_order;
					 l2_isLtBorder <= l1_isLtBorder;
					 l2_BtBorderInfo <= l1_BtBorderInfo;	

					 l2_RtBorderInfo <=l1_RtBorderInfo;
					 
					 l2_cIdx <= l1_cIdx;
					 l2_modeHor <= l1_modeHor;
					 {l2_isInter} <= {l1_isInter};
					 {l2_move,l2_weight} <={move,weight};
					 
					 l2_mainRefReg <= l1_mainRefReg;
					 l2_sub_top_left_pixel_P <= l1_sub_top_left_pixel_P;
					 l2_top_right_pixel <= l1_top_right_pixel;
					 l2_bottom_left_pixel <= l1_bottom_left_pixel;
					 l2_unFilDC <= l1_unFilDC;
					 l2_opt_recon <= l1_opt_recon;
					 l2_unFil_opt	<=	l1_unFil_opt;
					 l2_DC_xxxx_data <=	 l1_DC_xxxx_data;
					end
				if(!bStop_3)	begin
					 //	3rd stage ~ 4th stage
					 l3_tuSize <= l2_tuSize;
					 l3_cIdx  <= l2_cIdx;				 
			   end
			 
				if(resi_rdy && resi_val)
					 r_reconSamples<=reconSamples;
					 
			    if(!bDelayWrite)	begin
					if(!bStop_3)	begin
					 w_addr_TL <= w_addr_TL_;
					 w_addr <= w_addr_;
					 w_data_TL <= w_data_TL_;
					 w_data <= w_data_;
					 wE_n <= wE_n_;		
				   end
			   end
				else	begin
					if(!bStop_2)	begin
					 w_addr_TL <= w_addr_TL_;
					 w_addr <= w_addr_;
					 w_data_TL <= w_data_TL_;
					 w_data <= w_data_;
					 wE_n <= wE_n_;		
					 end
				end
			
			//	if(l_cIdx == 2 && cIdx==1 && !bStop_2) 			//fix it
				if(l_cIdx == 2 && cIdx==1 && !bStop_1_1) 			//fix it
					{l1_xTb_cr,l1_tuSize_cr}  <= {l_xTb,l_tuSize};
		 end
	end




	always @(*) begin
		if(w_addr_TL_ == r_addr_TL_ && rE_n_[8]==0 && wE_n_[8]==0)
			rE_n_tmp[8] = 1;
		else
			rE_n_tmp[8] = rE_n_[8];
	end
	
	generate genvar i;
			for(i=0;  i<8; i=i+1) begin:xi
				always @(*) begin
					if(w_addr_[(8*realAW_Y-1-realAW_Y*i):(7*realAW_Y-realAW_Y*i)]==r_addr_[(8*realAW_Y-1-realAW_Y*i):(7*realAW_Y-realAW_Y*i)] && wE_n_[i]==0 && rE_n_[i]==0) 
						rE_n_tmp[i] = 1;
					else
						rE_n_tmp[i] = rE_n_[i];
				end
			end
		endgenerate

	always @(posedge clk or negedge arst_n) begin
		if(!arst_n)
			rE_n <= {9'b111111111};
		else if(!rst_n)
			rE_n <= {9'b111111111};
		else if(!bStop_0) 
			rE_n <= rE_n_tmp;
	end
	
	
	
	
	/*   1st     stage  */

	reg [12:0]  			l3_xTb;
	reg [12:0] 				l3_yTb;
	reg [5:0]				l3_mode;
	reg [2:0]				l3_X,l3_Y;
	reg						l3_isInter;

	always @(posedge clk or negedge arst_n)
  if(!arst_n)
    {l3_X,l3_Y,l3_mode,l3_xTb,l3_yTb,l3_isInter} <= 0;
  else if(!rst_n)
    {l3_X,l3_Y,l3_mode,l3_xTb,l3_yTb,l3_isInter} <= 0;
  else if(!bStop_3)
    {l3_X,l3_Y,l3_mode,l3_xTb,l3_yTb,l3_isInter} <= 
    {l2_X_tr,l2_Y_tr,l2_mode,l2_xTb,l2_yTb,l2_isInter};
	
	reg  [20:0]  lineNum;
	always @(posedge clk or negedge arst_n)  begin
	  if(!arst_n)
		lineNum <= 1;
	  else begin
		if(resi_rdy && resi_val)
			lineNum <= lineNum+1;
	    end
	end

	

intra_inputTrafo  #(.isChroma(isChroma)) cInputTrafo(
	.xCtb(xCtb_),
	.yCtb(yCtb_),
	.xTb_rela(xTb_rela_),
	.yTb_rela(yTb_rela_),
	.i_tuSize(tuSizeLog2_),
	.xTb(xTb),		//out
	.yTb(yTb),		//out
	.tuSize(tuSize)
);
	
	
intra_fsm #(.isChroma(isChroma)) cFSM(
	  .clk(clk)
	  ,.arst_n(arst_n)
	  ,.rst_n(rst_n)
	  ,.X(X)
	  ,.Y(Y)
	  ,.mode(mode_)
	  ,.tuSize(tuSize)
	  ,.preStage(preStage)
	  ,.order(order)
	  ,.bStop(bStop)
	  ,.cIdx(cIdx)
	  ,.isInter(isInter)
);

intra_pIdx #(.isChroma(isChroma)) cPIdx(
    .xTb(lz_xTb)
    ,.yTb(lz_yTb)
    ,.tuSize(lz_tuSize)
    ,.pIdx(lz_partIdx)
);


intra_read #(.AW(realAW_Y),.AW_TL(realAW_TL_Y),.isChroma(isChroma))cRead(
	.clk(clk),
	.arst_n(arst_n),
	.rst_n(rst_n),
	.bStop(bStopz),
	.bStop_(bStop_0),
	.pseuAdr(lz_pseuAdr),		//i
	.pIdx(lz_partIdx),
	.X(lz_X),
	.Y(lz_Y),
	.xTb(lz_xTb),
	.yTb(lz_yTb),
	.tuSize(lz_tuSize),
	.r_addr(r_addr_),		//o		real address
	.r_addr_TL(r_addr_TL_),
	.rE_n(rE_n_),
	.horFlag(horFlag),
	.verFlag(verFlag),
	.verLevel_o(verLevel),
	.horLevel_o(horLevel),
	.isCalStage(lz_preStage[3]),
	.nMaxCUlog2(nMaxCblog2),
	.isFirstCycInTb(lz_isFirstCycInTb),
	.cIdx(lz_cIdx),
	.isRtBorder(lz_RtBorderInfo[5]),
	.isBtBorder(lz_BtBorderInfo[5]),
	.posRtBorderIn4(lz_RtBorderInfo[4:0]),
	.posBtBorderIn4(lz_BtBorderInfo[4:0]),
	.o_modiPsAdr(l0_pseuAdr),
	.o_modiPosIn4(l0_modiPosIn4),
	.o_ram_idx(l0_ram_idx)
	);
	
intra_pseudoAddr  cPseudoAddr(
	.mode(mode_),			//i
	.X(X),				//i
	.Y(Y),
	.preStage(preStage)
	,.tuSize(tuSize)
	,.pseuAdr(pseuAdr)
);		

// synopsys translate_off
// synopsys translate_on	
intra_SRAMCtrl #(.bitDepth(bitDepthY),.AW(realAW_Y),.AW_TL(realAW_TL_Y)) cSRAMCtrl (
	 .rclk(clk),
	 .rAdr(r_addr),
	 .rAdr_TL(r_addr_TL),
	 .rData(r_data),
	 .rData_TL(top_left_pixel),
	 .rE_n(rE_n),
	 .bStop_r(bStop0),
/*   1st     stage    > */	
 
/*   4th     stage    > */	 	 
	 .wclk(clk),
	 .wAdr(w_addr),
	 .wAdr_TL(w_addr_TL),
	 .wData(w_data),
	 .wData_TL(w_data_TL),
	 .wE_n(wE_n)
	 
	
);	

/*   3rd     stage    > */	


/*<<<<   2nd     stage    */	 	 
intra_border cBorder (
	.xTb(lz_xTb)			//input
	,.yTb(lz_yTb)
	,.pic_width_in_samples(pic_width_in_luma_samples>>isChroma)
	,.pic_height_in_samples(pic_height_in_luma_samples>>isChroma)
	,.first_ctu_in_slice_x(first_ctu_in_slice_x)
	,.first_ctu_in_slice_y(first_ctu_in_slice_y)
	,.first_ctu_in_tile_x(first_ctu_in_tile_x)
	,.first_ctu_in_tile_y(first_ctu_in_tile_y)
	,.last_ctu_in_tile_x(last_ctu_in_tile_x)
	,.last_ctu_in_tile_y(last_ctu_in_tile_y)
	,.nMaxCUlog2(nMaxCblog2)
	,.tuSize(lz_tuSize)
	
	,.isAbove(lz_isAbove)	//output
	,.isLeft(lz_isLeft)
	,.isTopLeft(lz_isTopLeft)
	,.isLtBorder(lz_isLtBorder)
	,.isRtBorder(lz_RtBorderInfo[5])
	,.isBtBorder(lz_BtBorderInfo[5])
	,.posRtBorderIn4(lz_RtBorderInfo[4:0])
	,.posBtBorderIn4(lz_BtBorderInfo[4:0])
);


intra_refPosGen   cRefPosGen(
	.mode(l_mode),			//i
	.X(l_X),				//i
	.Y(l_Y),
	.ref_pos(ref_pos),   //o
	.ref_TLADflag(ref_TLADflag)  //o
	,.preStage(l_preStage)
	,.tuSize(l_tuSize)
);

intra_s2RefSubsti #(.bitDepth(bitDepthY), .isChroma(isChroma)) cS2RefSubsti (
	.pseuAdr(l_pseuAdr),
	.isAbove(l_isAbove),
	.isLeft(l_isLeft),
	.isTopLeft(l_isTopLeft),
	.tuSize(l_tuSize),
	.isBtBorder(l_BtBorderInfo[5]),
	.isRtBorder(l_RtBorderInfo[5]),
	.posBtBorderIn4(l_BtBorderInfo[4:0]),
	.posRtBorderIn4(l_RtBorderInfo[4:0]),
	.nMaxCUlog2(nMaxCblog2),
	.data(r_data),
	.data_tl(top_left_pixel),
	.horLevel_i(l_horLevel),
	.verLevel_i(l_verLevel),
	.verFlag(l_verFlag),
	.sub_data(sub_data),
	.sub_tl(sub_top_left_pixel),
	.partIdx(l_partIdx),
	.pre_tuSize(p_tuSize),
	.pre_xTb(p_xTb),
	.pre_modeHor(l2_modeHor),
	.xTb(l_xTb),
	.xTbInCU(l_xTbInCU),
	.yTbInCU(l_yTbInCU),
	.byPa_DW_A_3(byPa_DW_A_3[4*bitDepthY-1:0]),
	.byPa_P_A_2(byPa_P_A_2),
	.byPa_P_A_2_cr(byPa_P_A_2_cr),
	.bp_pos_1(bp_pos_1),
	.bp_pos_2(bp_pos_2),
	.bp_pos_3(bp_pos_3),
	.order(l_order),
	.clk(clk),
	.rst_n(rst_n),
	.arst_n(arst_n),
	.bStop(bStop_1),
	.i_modiPosIn4(l_modiPosIn4),
	.awkCnt(l_awkCnt),
	.cIdx(l_cIdx),
	
	.by4_1_forStop(by4_1_forStop),
	.by4_1_forStop_cr(by4_1_forStop_cr),
	.by4_1_forStop_pos(by4_1_forStop_pos),
	
	.substi_Opt(substi_Opt),
	.gp_bitDepth(gp_bitDepth)
);


intra_util #(.isChroma(isChroma)) intra_util(
	.clk(clk)
	,.rst_n(rst_n)
	,.arst_n(arst_n)
	,.bStop(bStop_1)
	,.bStop1(bStop1)
	,.X(l_X)
	,.Y(l_Y)
	,.mode(l_mode)
	,.tuSize(l_tuSize)
	,.preStage(l_preStage)
	,.options(l1_options)
	,.ref_pos(ref_pos)
	,.ref_flag(ref_TLADflag)
	,.ramIdxMapping(l_ram_idx)
	,.idx_mapped_(idx_mapped_)
	,.isInter(l_isInter)
	,.modeHor(l_modeHor)
	,.opt_recon(l1_opt_recon)
	,.unFil_opt_(l1_unFil_opt)
);
/*   2nd     stage    >>>>*/	



/* <  3rd     stage  */


intra_l1_stage #(.bitDepthY(bitDepthY), .isChroma(isChroma), .ANG_BDEPTH(ANG_BDEPTH),.PLA_2_BDEPTH(PLA_2_BDEPTH)) intra_l1_stage(
	.sub_data(sub_data),
	.sub_top_left_pixel(sub_top_left_pixel),
	.byPa_P_DR_1(byPa_P_DR_1),
	.byPa_P_DR_1_cr(byPa_P_DR_1_cr),
	.substi_Opt(substi_Opt),
	.btRtSamples(btRtSamples)
	,.clk(clk)
	,.rst_n(rst_n)
	,.arst_n(arst_n)
	,.bStop_1_1(bStop_1_1)
	,.bStop_2(bStop_2)
	,.l1_mainRefReg(l1_mainRefReg)		//o		8 pixels 
	,.l1_top_right_pixel(l1_top_right_pixel)
	,.l1_bottom_left_pixel(l1_bottom_left_pixel)
	,.l1_sub_top_left_pixel_P(l1_sub_top_left_pixel_P)
	,.l1_ref_pos(l1_ref_pos)
	,.l1_ref_TLADflag(l1_ref_TLADflag)
	,.l1_mode(l1_mode)
	,.l1_tuSize(l1_tuSize)
	,.l1_X(l1_X)
	,.l1_Y(l1_Y)
	,.l1_preStage(l1_preStage)
	,.l1_ram_idx(l1_ram_idx)
	,.l1_options(l1_options)
	,.idx_mapped_(idx_mapped_)
	,.gp_bitDepth(gp_bitDepth)
	,.l1_weight(weight)
	,.l1_move(move)
	,.r_r0(r_r0)
	,.r_r1(r_r1)
	//,.r_r0_(r_r0_)
	//,.r_r1_(r_r1_)
//	,.r_ang_0(r_ang_0)
//	,.r_ang_1(r_ang_1)
	,.r_plan_0(r_plan_0)
	,.r_plan_1(r_plan_1)
	,.r_plan_2(r_plan_2)
	,.r_plan_3(r_plan_3)
	,.DC_xxxx_data(l1_DC_xxxx_data)
);

 intra_util_w intra_util_w(
	.clk(clk),
	.arst_n(arst_n),
	.rst_n(rst_n),
	.bStop(bStop_2),
	.bStop_1_1(bStop_1_1)
	,.xTb(l1_xTb)
	,.yTb(l1_yTb)
	,.l_xTb(l_xTb)
	,.l_yTb(l_yTb)
	,.X(l1_X_tr)
	,.Y(l1_Y_tr)
	,.l_X(l_X_tr)
	,.l_Y(l_Y_tr)
	,.tuSize(l1_tuSize)
	,.partIdx(l1_partIdx)
	,.nMaxCUlog2(nMaxCblog2)
	,.verFlag(l1_verFlag)
	,.horFlag(l1_horFlag)
	,.isCalStage(l1_preStage[3])
	,.opt_w_tl_(opt_w_tl)
	,.opt_w_(opt_w)
	,.w_TL_rela_(w_TL_rela_)
);

  intra_pred_l2 #(.bitDepth(bitDepthY),.ANG_BDEPTH(ANG_BDEPTH),.PLA_2_BDEPTH(PLA_2_BDEPTH))cPred(
	.clk(clk),
	.arst_n(arst_n),
	.rst_n(rst_n),
	.bStop(bStop_2),
	.weight(l2_weight),              //i
	.mainRefReg(l2_mainRefReg),      //i
	.predSamples(predSamples),    //o
	.mode(l2_mode),				//i
	.top_left_pixel(l2_sub_top_left_pixel_P),
	.X(l2_X[2:0]),
	.Y(l2_Y[2:0])
	,.isPredFilter(l2_isPredFilter)
	,.tuSize(l2_tuSize)
	,.gp_bitDepth(gp_bitDepth)
	,.r_r0(r_r0)
	,.r_r1(r_r1)
//	,.r_ang_0(r_ang_0)
//	,.r_ang_1(r_ang_1)
	,.r_plan_0(r_plan_0)
	,.r_plan_1(r_plan_1)
	,.r_plan_2(r_plan_2)
	,.r_plan_3(r_plan_3)
	,.unFil_opt(l2_unFil_opt)
	,.preStage(l2_preStage)
	,.DC_xxxx_data(l2_DC_xxxx_data)
//	,.r_r0_(r_r0_)
//	,.r_r1_(r_r1_)
  );
  
    intra_mode2angle cMode2angle(
	  .mode(l1_mode),		//i
	  .angle(angle)			//o
  );
  
  intra_angleToang cAngleToang(
	   .angle(angle),      //input 
	   .ang(ang)       //output 
  );
  
   	 
  intra_lut1 cLut1(
	  .ang(ang),             //i
	  .yPos(l1_Y),            //i
	  .move(move)            //o
  );
  
  intra_lut2 cLut2(
    .ang(ang),      //i
    .yPos(l1_Y),     //i
    .weight(weight)       //o
  );
  
  intra_recon #(.pixWidth(bitDepthY))cRecon(
	  .clk(clk),
	  .arst_n(arst_n),
	  .rst_n(rst_n),
	  .predSamples(predSamples),
	  .predSamples_inter(predSamples_inter),
	  .residuals(residuals),
	  .reconSamples(reconSamples)
	  ,.tuSize(l2_tuSize)
	  ,.r_reconSamples(r_reconSamples)
	  ,.gp_bitDepth(gp_bitDepth)
	  ,.opt_recon(l2_opt_recon)
  );
  
 
  intra_exchangeXY  cExchangeXY(
	.isInter(l_isInter),
	.modeHor(l_modeHor)
	,.i_X(l_X)
	,.i_Y(l_Y)
	,.o_X(l_X_tr)
	,.o_Y(l_Y_tr)
);

	intra_bypass #(.bitDepth(bitDepthY) ,.isChroma(isChroma)) cByPass(
		.clk(clk),
		.arst_n(arst_n),
		.rst_n(rst_n),
		.bStop(bStop2),
		.n_bStop(bStop1_1),
		.nn_bStop(bStop1),
		.tuSize(l2_tuSize),
		.n_tuSize(l1_tuSize),
		.X(l2_X_tr),
		.Y(l2_Y_tr),
		.isLtBorder(l2_isLtBorder),
		.isBtBorder(l2_BtBorderInfo[5]),
		.isRtBorder(l2_RtBorderInfo[5]),
		.posBtBorderIn4(l2_BtBorderInfo[4:0]),
		.posRtBorderIn4(l2_RtBorderInfo[4:0]),	
		.partIdx(l2_partIdx),
		.n_partIdx(l1_partIdx),
		.xTb(l2_xTb),
		.yTb(l2_yTb),
		.nxtXTb(l1_xTb),
		.nxtYTb(l1_yTb),
		.i_recSamples(reconSamples),
		.l3_i_recSamples(r_reconSamples),
		.isCalStage(l2_preStage[3]),	
		.order(l2_order),
		.nMaxCUlog2(nMaxCblog2),
		.cIdx(l2_cIdx),
		.n_cIdx(l1_cIdx),
		.nn_cIdx(l_cIdx),
		.byPa_P_DR_1(byPa_P_DR_1),
		.byPa_P_DR_1_cr(byPa_P_DR_1_cr),
		.byPa_P_A_2(byPa_P_A_2),
		.byPa_P_A_2_cr(byPa_P_A_2_cr),
		.byPa_DW_A_3(byPa_DW_A_3),	
		.bypa_pos_1(bp_pos_1),
		.bypa_pos_2(bp_pos_2),
		.bypa_pos_3(bp_pos_3),	
		.btRtSamples(btRtSamples),
		.by4_1_forStop(by4_1_forStop),
		.by4_1_forStop_cr(by4_1_forStop_cr),
		.by4_1_forStop_pos(by4_1_forStop_pos),
		.n_isBtTb4(l1_yTb==((pic_height_in_luma_samples>>isChroma)-4)),
		.n_isRtTb4(l1_xTb==((pic_width_in_luma_samples>>isChroma)-4)),
		.n_isBtTb8(l1_yTb==((pic_height_in_luma_samples>>isChroma)-8)),
		.n_isRtTb8(l1_xTb==((pic_width_in_luma_samples>>isChroma)-8)),
		.n_modeHor(l1_modeHor),
		.n_order(l1_order)
	);
	
 /*   3rd stage >>>>*/
	
 /*<<<<   3th stage     */
  intra_write #(.bitDepth(bitDepthY),.AW(realAW_Y),.AW_TL(realAW_TL_Y),.isChroma(isChroma)) cWrite(
	.clk(clk),
	.arst_n(arst_n),
	.rst_n(rst_n),
	.bStop(bStop2),
	.bStop_pre(bStop1_1),
	.reconSamples(reconSamples)					//i
	,.xTb(l2_xTb)
	,.yTb(l2_yTb)
	,.X(l2_X_tr)
	,.Y(l2_Y_tr)
	,.tuSize(l2_tuSize)
	,.partIdx(l2_partIdx)
	,.nMaxCUlog2(nMaxCblog2)
	,.verFlag(l2_verFlag)
	,.horFlag(l2_horFlag)
	,.isLastCycInTb(l2_isLastCycInTb)
	,.r_tl_data(byPa_DW_A_3[6*bitDepthY-1:4*bitDepthY])
	,.isCalStage(l2_preStage[3])
	,.cIdx(l2_cIdx)
	
	,.w_data(w_data_)				//o
	,.w_data_TL(w_data_TL_)
	,.w_addr(w_addr_)
	,.w_addr_TL(w_addr_TL_)
	,.wE_n(wE_n_)
	
	,.bDelayWrite(bDelayWrite)
	,.opt_w_tl(opt_w_tl)
	,.opt_w(opt_w)
	,.w_TL_rela_(w_TL_rela_)

);
 /*   3th stage >>>>*/


  
endmodule


