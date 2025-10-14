module intra_l1_stage (
	clk
	,rst_n
	,arst_n
	,bStop_1_1
	,bStop_2
	,l1_ref_pos
	,l1_ref_TLADflag
	,l1_mode
	,l1_tuSize
	,l1_X
	,l1_Y
	,l1_preStage
	,l1_ram_idx
	,l1_options
	,idx_mapped_
	,gp_bitDepth,
	sub_data,
	sub_top_left_pixel,
	l1_sub_top_left_pixel_P,
	byPa_P_DR_1,
	byPa_P_DR_1_cr
	,btRtSamples
	,substi_Opt	
	,l1_mainRefReg
	,l1_top_right_pixel
	,l1_bottom_left_pixel
	,l1_move
	,l1_weight
	,r_r0
	,r_r1
//	,r_ang_0
//	,r_ang_1
	,r_plan_0
	,r_plan_1
	,r_plan_2
	,r_plan_3
	//,r_r0_
//	,r_r1_ 
	,DC_xxxx_data
);

	parameter bitDepthY = 4'd10;
	parameter SRAMDW = bitDepthY*4;
	parameter nSRAMs 		=8;
	parameter isChroma = 0;
	parameter MAINREF_DW = bitDepthY*8;   // 8bits x 8 pixels
	parameter ANG_BDEPTH = bitDepthY+5;
	parameter PLA_2_BDEPTH = bitDepthY+3;
	
input	[SRAMDW*8-1:0]			sub_data;
input 	[bitDepthY-1:0] 		sub_top_left_pixel;
input 	[bitDepthY*4-1:0] 		byPa_P_DR_1;
input 	[bitDepthY*4-1:0] 		byPa_P_DR_1_cr;
input	[3*nSRAMs+1:0]			substi_Opt;
input   [bitDepthY*2-1:0] 		btRtSamples;	

input 							clk,rst_n,arst_n,bStop_1_1,bStop_2;
input	[53:0]					l1_options;
input 	[5:0]					l1_mode;		
input 	[2:0] 					l1_X,l1_Y;
input 	[47:0] 					l1_ref_pos;
input 	[15:0] 					l1_ref_TLADflag;
input		[2:0]				l1_tuSize;
input 	[3:0] 					l1_preStage;
input 	[nSRAMs*3-1:0]			l1_ram_idx;
input	[3*24-1:0]				idx_mapped_;
input	[3:0]					gp_bitDepth;

input	[19:0] 					l1_weight;
input	[11:0]					l1_move;	
output 	[bitDepthY-1:0] 		l1_sub_top_left_pixel_P;
output 	[MAINREF_DW-1:0]		l1_mainRefReg;
output	[(bitDepthY+3)*2-1:0] 	DC_xxxx_data;
output 	[bitDepthY-1:0] 		l1_top_right_pixel,l1_bottom_left_pixel;
//output  [(bitDepthY+1)*16-1:0]	 r_r0,r_r1,r_r0_,r_r1_; 
output  [(bitDepthY+1)*16-1:0]	 r_r0,r_r1; 
//output  [ANG_BDEPTH*16-1:0]	 r_ang_0,r_ang_1; 
output  [PLA_2_BDEPTH*16-1:0]	 r_plan_2; 
output  [PLA_2_BDEPTH*16-1:0]	 r_plan_3; 
output  [(bitDepthY+4)*16-1:0]	 r_plan_0,r_plan_1; 

wire 	[SRAMDW*8-1:0] 			sub_data_P;



intra_s3RefSubsti #(.bitDepth(bitDepthY), .isChroma(isChroma)) cS3RefSubsti(
	.data(sub_data),
	.data_tl(sub_top_left_pixel),
	.byPa_P_DR_1(byPa_P_DR_1),
	.byPa_P_DR_1_cr(byPa_P_DR_1_cr),
	.substi_Opt(substi_Opt),
	.btRtSamples(btRtSamples),
	//output
	.sub_data(sub_data_P),
	.sub_tl(l1_sub_top_left_pixel_P)
);

 
 intra_pixCtrl #(.isChroma(isChroma),.bitDepthY(bitDepthY)) cPixCtrl(
	  .clk(clk)
	  ,.rst_n(rst_n)
	  ,.arst_n(arst_n)
	  ,.bStop(bStop_1_1)
	  ,.sramData(sub_data_P),
	  .ref_pos(l1_ref_pos),
	  .ref_flag(l1_ref_TLADflag)
	  ,.mode(l1_mode)
	  ,.tuSize(l1_tuSize)
	  ,.X(l1_X)
	  ,.Y(l1_Y)
	  ,.top_left_pixel(l1_sub_top_left_pixel_P)		//i	  
	  ,.preStage(l1_preStage)	  
	  ,.ramIdxMapping(l1_ram_idx)
	  ,.options(l1_options)
	  ,.idx_mapped_(idx_mapped_)
	  ,.gp_bitDepth(gp_bitDepth)
	  
	  ,.o_mainRefReg(l1_mainRefReg)		//o		8 pixels 
	  ,.top_right_pixel(l1_top_right_pixel)
	  ,.bottom_left_pixel(l1_bottom_left_pixel)
	  ,.DC_xxxx_data(DC_xxxx_data)
);

intra_pred_l1 #(.bitDepth(bitDepthY),.ANG_BDEPTH(ANG_BDEPTH),.PLA_2_BDEPTH(PLA_2_BDEPTH)) intra_pred_l1(
	.clk(clk),
	.arst_n(arst_n),
	.rst_n(arst_n),
	.bStop(bStop_2),
	.weight(l1_weight),              //i
	.mainRefReg(l1_mainRefReg),      //i
	.move(l1_move),                   //i
	.X(l1_X),
	.Y(l1_Y),
	.top_right_pixel(l1_top_right_pixel),
	.bottom_left_pixel(l1_bottom_left_pixel),
	.r_r0(r_r0)
	,.r_r1(r_r1)
	//,.r_r0_(r_r0_)
	//,.r_r1_(r_r1_)
	//.r_ang_0(r_ang_0)
	//,.r_ang_1(r_ang_1)
	,.r_plan_0(r_plan_0)
	,.r_plan_1(r_plan_1)
	,.r_plan_2(r_plan_2)
	,.r_plan_3(r_plan_3)
);

endmodule 

