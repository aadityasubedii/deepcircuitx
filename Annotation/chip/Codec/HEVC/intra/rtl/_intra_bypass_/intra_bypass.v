`timescale 1ns/1ps
module intra_bypass(
	clk,
	arst_n,
	rst_n,
	bStop,
	n_bStop,
	nn_bStop,
	tuSize,
	n_tuSize,
	X,
	Y,
	partIdx,
	n_partIdx,
	xTb,
	yTb,
	nxtXTb,
	nxtYTb,
	isLtBorder,
	isBtBorder,
	isRtBorder,
	posBtBorderIn4,
	posRtBorderIn4,
	
	i_recSamples,
	l3_i_recSamples,
	isCalStage,
	order,
	nMaxCUlog2,
	cIdx,
	n_cIdx,
	nn_cIdx,
	
	byPa_P_DR_1,
	byPa_P_DR_1_cr,
	byPa_P_A_2,
	byPa_P_A_2_cr,
	byPa_DW_A_3,
	
	bypa_pos_1,
	bypa_pos_2,
	bypa_pos_3
	
	,btRtSamples
	,by4_1_forStop
	,by4_1_forStop_cr
	,by4_1_forStop_pos
	
	,n_isBtTb4
	,n_isRtTb4	
	,n_isBtTb8
	,n_isRtTb8
	
	,n_modeHor
	,n_order
);

  parameter bitDepth = 8;
  parameter isChroma = 0;

	input								clk,rst_n,arst_n,bStop,n_bStop,nn_bStop;
	input								n_modeHor;
	input 	[2:0] 						tuSize,n_tuSize;
	input 	[12:0]						xTb,nxtXTb;
	input 	[12:0]						yTb,nxtYTb;
	input	[2:0]						X,Y;
	input	[1:0]						partIdx,n_partIdx;
	input   [16*bitDepth-1:0] 			i_recSamples;	
	input   [16*bitDepth-1:0] 			l3_i_recSamples;	
	input	[2:0]						order,n_order;
	input	[2:0]						nMaxCUlog2;
	input								isLtBorder;
	input								isBtBorder;
	input								isRtBorder;
	input	[4:0]						posBtBorderIn4,posRtBorderIn4;
	input								isCalStage;
	input	[1:0]						cIdx,n_cIdx,nn_cIdx;
	input								n_isBtTb4,n_isBtTb8;
	input								n_isRtTb4,n_isRtTb8;
	
	reg [4:0]						bp1_pos,bp2_pos,bp3_pos,by4_1_forStop_pos_;
	reg								bp1_f,bp2_f,bp3_f;
	reg [5:0]						temp_bp3_pos;
	output reg [5:0]				bypa_pos_1,bypa_pos_2,bypa_pos_3;
	output  [bitDepth*4-1:0] 					byPa_P_DR_1;      //8bits x 4 pixels
	output  [bitDepth*4-1:0]						byPa_P_DR_1_cr;
	output  [bitDepth*16-1:0] 					byPa_P_A_2;      //     ,4 samples		
	output  [bitDepth*11-1:0] 					byPa_P_A_2_cr;
	output  [bitDepth*6-1:0] 					byPa_DW_A_3;      //8bits x 4 pixels		
	output	[bitDepth*2-1:0] 					btRtSamples;
	output reg 	[bitDepth*4-1:0] 				by4_1_forStop,by4_1_forStop_cr;
	output reg 	[4:0]								by4_1_forStop_pos;
	
	reg [bitDepth-1:0]				recon[3:0][3:0];
	reg [bitDepth-1:0]				l3_recon[3:0][3:0];
	
	reg [bitDepth-1:0]				r_l,r_t,r_b,r_rt;
	reg [bitDepth-1:0]				r_br01_4,r_br01_8,r_br01_16,r_br01_32,r_br01_64;
	reg [bitDepth-1:0]				r_br2_8,r_br2_16,r_br2_32;
	
	reg [bitDepth-1:0]				r_l_cr,r_t_cr,r_b_cr,r_rt_cr;
	reg [bitDepth-1:0]				r_br01_4_cr,r_br01_8_cr,r_br01_16_cr,r_br01_32_cr;
	reg [bitDepth-1:0]				r_br2_8_cr,r_br2_16_cr,r_br2_32_cr;
	
	reg [bitDepth-1:0]				r_b_rt_tmp,r_l_tmp,r_t_tmp,r_br01_tmp;
	reg [bitDepth-1:0]				r_b_rt_tmp_cr,r_l_tmp_cr,r_t_tmp_cr,r_br01_tmp_cr;
	reg [bitDepth-1:0]				r_tl_4,r_tl_4_cr;
	
	reg [bitDepth*4-1:0]				p_dr1_4samples;
	reg	[bitDepth*4-1:0]				p_dr1_4samples_cr;
	reg [bitDepth*4-1:0]				p_a2_4samples;
	reg [bitDepth*4-1:0]				dw_a3_4samples;	
	reg [bitDepth*4-1:0]				temp_by4_1_forStop;
	
	reg 								cLastBut2,cLastBut3;
	
	
	assign byPa_P_DR_1 = {p_dr1_4samples};
	assign byPa_P_DR_1_cr = p_dr1_4samples_cr;
	assign byPa_P_A_2 = {r_l,r_t,r_br01_4,r_br01_8,r_br01_16,r_br01_32,r_br01_64,r_br2_8,r_br2_16,r_br2_32,r_b,r_rt,p_a2_4samples};
	assign byPa_P_A_2_cr = {r_l_cr,r_t_cr,
							r_br01_4_cr,r_br01_8_cr,r_br01_16_cr,r_br01_32_cr,
							r_br2_8_cr,r_br2_16_cr,r_br2_32_cr,r_b_cr,r_rt_cr};
	assign byPa_DW_A_3 = {r_tl_4,r_tl_4_cr,dw_a3_4samples};
	assign btRtSamples =  {r_b,r_rt};
	
	reg x8;
	reg y8;
	
	reg [bitDepth*4-1:0]  bypa_1,bypa_2,bypa_3,tempForbp3;
	reg [bitDepth*4-1:0]  bypa_1_cr;
	
	reg [6:0] 	nPB,nMaxCU;
	reg [6:0] 	y_bar,x_bar,y_PB_bot,x_PB_right;
	reg [5:0] 	Xplus1sf2,Yplus1sf2;
	reg [4:0]	x4InMaxCb,y4InMaxCb;
	reg [4:0]	n_x4InMaxCb,n_y4InMaxCb;
	
	reg [bitDepth-1:0]				a[3:0],a_cr[3:0];	//for debug
//	reg [1:0]   pIdx_4,pIdx_8,pIdx_16,pIdx_32;
	reg [1:0]   n_pIdx_4,n_pIdx_8,n_pIdx_16,n_pIdx_32;
	reg 			nxt_lt_cur_xTb;
	reg 			nnxt_lt_nxt_xTb;
	
	reg				bDelayWrite;
	
	always @(*)	begin
		x8 = (xTb>>3)%2;
		y8 = (yTb>>3)%2;
		{a[0],a[1],a[2],a[3]} = bypa_3;
		{a_cr[0],a_cr[1],a_cr[2],a_cr[3]} = bypa_1_cr;		//for debug
		
		n_pIdx_4 = {nxtYTb[2],nxtXTb[2]};
		n_pIdx_8 = {nxtYTb[3],nxtXTb[3]};
		n_pIdx_16 = {nxtYTb[4],nxtXTb[4]};
		n_pIdx_32 = {nxtYTb[5],nxtXTb[5]};
		
	//	bypa_pos_1 =  {bp1_f,bp1_pos};
			
		nnxt_lt_nxt_xTb=0;

		if(n_tuSize==2)  begin
			if( (n_pIdx_4[0]==0 && !n_isRtTb4) || n_isBtTb4)	nnxt_lt_nxt_xTb = 0;
			else if(n_pIdx_4==1 || n_isRtTb4)	nnxt_lt_nxt_xTb = 1;
			else begin
				if( (n_pIdx_8[0]==0 && !n_isRtTb4) || n_isBtTb4)	nnxt_lt_nxt_xTb = 0;
				else if(n_pIdx_8==1 || n_isRtTb4)	nnxt_lt_nxt_xTb = 1;
				else begin
					if((n_pIdx_16[0]==0 && !n_isRtTb4) || n_isBtTb4)	nnxt_lt_nxt_xTb = 0;
					else if(n_pIdx_16==1 || n_isRtTb4) 	nnxt_lt_nxt_xTb = 1;
					else begin
						if((n_pIdx_32[0]!=1 && !n_isRtTb4 )|| n_isBtTb4)	nnxt_lt_nxt_xTb = 0;
						else if(n_pIdx_32==1) 	nnxt_lt_nxt_xTb = 1;
					end
				end
			end
		end
		if(n_tuSize==3)  begin
			if((n_pIdx_8[0]==0 && !n_isRtTb8) || n_isBtTb8)	nnxt_lt_nxt_xTb = 0;
				else if(n_pIdx_8==1 || n_isRtTb8)	nnxt_lt_nxt_xTb = 1;
				else begin
					if((n_pIdx_16[0]==0 && !n_isRtTb8) || n_isBtTb8)	nnxt_lt_nxt_xTb = 0;
					else if(n_pIdx_16==1 || n_isRtTb8) 	nnxt_lt_nxt_xTb = 1;
					else begin
						if((n_pIdx_32[0]!=1 && !n_isRtTb8 )|| n_isBtTb8)	nnxt_lt_nxt_xTb = 0;
						else if(n_pIdx_32==1) 	nnxt_lt_nxt_xTb = 1;
					end
				end
		end


	end
	
	always @(posedge clk or negedge arst_n)	begin
		if(~arst_n)	begin
			p_dr1_4samples <= 0;
			p_dr1_4samples_cr <= 0;
			p_a2_4samples <= 0;
			dw_a3_4samples <= 0;
			tempForbp3 <= 0; 
			bypa_pos_1 <= 0;
			bypa_pos_2 <= 0;
			temp_bp3_pos <= 0;
			bypa_pos_3 <= 0;
			by4_1_forStop <= 0;
			by4_1_forStop_cr<=0;
			by4_1_forStop_pos <=0;
			nxt_lt_cur_xTb <= 0;
			bDelayWrite<=0;
		end
		else if(~rst_n) begin
			p_dr1_4samples <= 0;
			p_dr1_4samples_cr <= 0;
			p_a2_4samples <= 0;
			dw_a3_4samples <= 0;
			tempForbp3 <= 0; 
			bypa_pos_1 <= 0;
			bypa_pos_2 <= 0;
			temp_bp3_pos <= 0;
			bypa_pos_3 <= 0;
			by4_1_forStop <= 0;
			by4_1_forStop_cr<=0;
			by4_1_forStop_pos <=0;
			nxt_lt_cur_xTb <= 0;
			bDelayWrite<=0;
		end
		else begin
			if(!bStop && !isChroma)	begin
				temp_bp3_pos <= {bp3_f,bp3_pos};
				bypa_pos_3 <=  temp_bp3_pos;
				tempForbp3 <= bypa_3;
				dw_a3_4samples <= tempForbp3;
			end
			else if(isChroma) begin
				if((!bDelayWrite && !n_bStop) || (bDelayWrite && !nn_bStop) )	begin
					bypa_pos_3 <=  temp_bp3_pos;
					dw_a3_4samples <= tempForbp3;
				end
				if(!bStop)	begin
					temp_bp3_pos <= {bp3_f,bp3_pos};
					tempForbp3 <= bypa_3;
				end
			end
			if(!bStop)	begin
				p_dr1_4samples <= cIdx!=2? bypa_1:p_dr1_4samples;
				p_dr1_4samples_cr <= cIdx==2? bypa_1_cr:p_dr1_4samples_cr; 
				p_a2_4samples <= bypa_2;

				if(cIdx==0 || (cIdx==2 && n_cIdx==1))	begin
					bypa_pos_2 <=  {bp2_f,bp2_pos};
					if(tuSize==2 && partIdx==1)
						by4_1_forStop_pos <= by4_1_forStop_pos_;
				end
			
				if(tuSize==2 && partIdx==1 )	begin
					if(cIdx[1] ==0)
						by4_1_forStop <=   temp_by4_1_forStop;
					else
						by4_1_forStop_cr <= temp_by4_1_forStop;
				end
			end
			if(!n_bStop) begin
				nxt_lt_cur_xTb <= nnxt_lt_nxt_xTb;
				if(n_cIdx==0 || (n_cIdx==2 && nn_cIdx==1))
						bypa_pos_1 <=  {bp1_f,bp1_pos};
			end
			
			if(!n_bStop && nn_bStop)
				bDelayWrite <=1;
			if(bDelayWrite && !nn_bStop)
				bDelayWrite <=0;
		end
	
	end
	

   generate
	  genvar i,j;
	  for(i=0;i<4; i=i+1)begin:yi			//i: row
		  for(j=0 ;j<4;j=j+1) begin: xi		//j: col
		   always @(*)       begin   
		      recon[i][j] = i_recSamples[16*bitDepth-1-bitDepth*(4*i+j): 15*bitDepth-bitDepth*(4*i+j)];
		      l3_recon[i][j] = l3_i_recSamples[16*bitDepth-1-bitDepth*(4*i+j): 15*bitDepth-bitDepth*(4*i+j)];
			  end
		 end
		end
	endgenerate

	
	
	/*<----   data byPassing in TU 4 and TU 8 to get rid of data dependency  */
	 always @(*) begin
		x4InMaxCb = (xTb%nMaxCU)>>2;
		y4InMaxCb = (yTb%nMaxCU)>>2;
		n_x4InMaxCb = (nxtXTb%nMaxCU)>>2;
		n_y4InMaxCb = (nxtYTb%nMaxCU)>>2;
		bp1_f =0; bp2_f=0; bp3_f=0;
		by4_1_forStop_pos_ = 0;
		bp2_pos = 16; bp3_pos = 16;
		bp1_pos = 16; bp1_f = 0;
		
		if(tuSize==2 && partIdx==1 )
			by4_1_forStop_pos_ = x4InMaxCb; 	
		if(!isChroma) begin
			if(tuSize == 3'd2) 
				case(partIdx)
				2'b00: begin
						bp3_pos = x4InMaxCb;	bp3_f =0;	
						end
				2'b01: begin
						bp3_pos = x4InMaxCb;	bp3_f =0;
						end
				2'b10:	begin
						bp3_pos = x4InMaxCb; 	bp3_f =0;
						end
				default:begin
						bp2_pos = (nxt_lt_cur_xTb)?x4InMaxCb:y4InMaxCb;	bp2_f = (nxt_lt_cur_xTb)?0:1;
						bp3_pos = (nxt_lt_cur_xTb)?x4InMaxCb:y4InMaxCb;	bp3_f = (nxt_lt_cur_xTb)?0:1;
						end
				endcase
			if(tuSize ==3'd3)	
				case({X[0],Y[0]})
				2'b10:	begin
							bp2_pos  = y4InMaxCb;	bp2_f = 1;
							bp3_pos  = y4InMaxCb;	bp3_f = 1;						
						end
				2'b01:	begin
							bp2_pos  = x4InMaxCb;	bp2_f = 0;
							bp3_pos  = x4InMaxCb;	bp3_f =0;
						end
				2'b11:  begin
							bp3_pos = nxt_lt_cur_xTb?x4InMaxCb+1:y4InMaxCb+1;
							bp3_f = nxt_lt_cur_xTb?0:1;
						end
				default:	
						begin
							bp2_pos = 16; bp2_f = 0;
							bp3_pos = 16; bp3_f =0;
						end
				endcase
			if(tuSize ==3'd4 ) begin
				if(X==3 && Y==0) begin
					bp3_pos  = y4InMaxCb;	bp3_f = 1;
				end
				if(X==0 && Y==3) begin
					bp3_pos  = x4InMaxCb;	bp3_f =0;
				end
			end	
				
			
			if(n_tuSize == 3'd2) 
		/*		case(n_partIdx)
				2'b00: begin bp1_pos = n_y4InMaxCb;	bp1_f =1; end
				2'b01: begin bp1_pos = n_x4InMaxCb;	bp1_f =0; end
				2'b10: begin bp1_pos = n_y4InMaxCb;	bp1_f =1; end
				default:*/
				begin
					bp1_pos = (nnxt_lt_nxt_xTb)?n_x4InMaxCb:n_y4InMaxCb; bp1_f = (nnxt_lt_nxt_xTb)?0:1;
				end
		//		endcase
				
			if(n_tuSize == 3'd3 && n_order==2)	begin
				bp1_pos = n_modeHor? n_x4InMaxCb:n_y4InMaxCb;
				bp1_f = n_modeHor? 0:1;
				end
		end
		else	begin	//chroma
			if(tuSize==2)
				begin	bp3_pos = (nxt_lt_cur_xTb)?x4InMaxCb:y4InMaxCb; bp3_f = (nxt_lt_cur_xTb)?0:1;				end
			/*	case(partIdx)
				2'd0: begin	bp3_pos = y4InMaxCb;	bp3_f =1;				end
				2'd1: begin	bp3_pos = x4InMaxCb;	bp3_f =0;				end
				2'd2: begin	bp3_pos = y4InMaxCb;	bp3_f =1;				end
				default:
				begin	bp3_pos = (nxt_lt_cur_xTb)?x4InMaxCb:y4InMaxCb; bp3_f = (nxt_lt_cur_xTb)?0:1;				end
				endcase*/
			if(tuSize==3 && cIdx==2 && order==2) begin
				if( nxt_lt_cur_xTb && Y==1) begin
					bp3_pos = x4InMaxCb; bp3_f = 0;
				end
				if( !nxt_lt_cur_xTb && Y==0) begin
					bp3_pos = y4InMaxCb; bp3_f = 1;
				end
			end
		end
			
	  end			//end always
	
	

  generate 
    genvar k;
    for ( k=0; k< 4 ; k= k+1) begin	:xk
      always @(*) begin
		bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;									//31-bitDepth*k:24-bitDepth*k
		temp_by4_1_forStop[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =0;						//31-bitDepth*k:24-bitDepth*k
		bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =0;													//31-bitDepth*k:24-bitDepth*k
		bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;	
		bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;	
		
		if(tuSize==2 && partIdx==1 )
			temp_by4_1_forStop[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];							//31-bitDepth*k:24-bitDepth*k
        if(tuSize == 3'd2) 	
			case(partIdx)
			2'b00: begin
					if(cIdx!=2)
						bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =	recon[k][3];	
					else
						bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =	recon[k][3];
					bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;   
					if(!isChroma)
						bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];
			//		else
			//			bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[k][3];
					end
			2'b01: begin
					if(cIdx!=2)
						bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =	recon[3][k]; 
					else
						bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =	recon[3][k]; 
					bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;  
					bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];
					end
			2'b10:	begin
					if(cIdx!=2)
						bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =	recon[k][3];
					else
						bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] =	recon[k][3];
					bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;  
					if(!isChroma)
						bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];
			//		else
			//			bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[k][3];
					end
			default:begin
					if(cIdx!=2)
						bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = (nxt_lt_cur_xTb)?recon[3][k]:recon[k][3];
					else
						bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = (nxt_lt_cur_xTb)?recon[3][k]:recon[k][3];
					bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = (nxt_lt_cur_xTb)?recon[3][k]:recon[k][3];
					bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = (nxt_lt_cur_xTb)?recon[3][k]:recon[k][3];
					end
			endcase
		if(isChroma && tuSize==2)
			bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = (nxt_lt_cur_xTb)?recon[3][k]:recon[k][3];
			
		if(tuSize ==3'd3)	
			case({X[0],Y[0]})
			2'b10:	begin
						if(cIdx!=2)
							bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[k][3];
						else
							bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;
						bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k]  = recon[k][3];
						if(!isChroma || (cIdx==2 && order==2 && !nxt_lt_cur_xTb))
							bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k]  = recon[k][3];	
							
					end
			2'b01:	begin
						if(cIdx!=2)
							bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];
						else
							bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;
						bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];
						if(!isChroma || (cIdx==2 && order==2 && nxt_lt_cur_xTb))
							bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];
					end
			2'b11:  bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = (nxt_lt_cur_xTb)?recon[3][k]:recon[k][3];
			default:	
					begin
						if(cIdx!=2)
							bypa_1[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;
						else
							bypa_1_cr[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;
						bypa_2[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;
						bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = 0;
					end
			endcase
		if(tuSize == 3'd4)
			if(X==3 && Y==0) bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[k][3];		
			if(Y==3 && X==0) bypa_3[bitDepth*4-1-bitDepth*k:bitDepth*3-bitDepth*k] = recon[3][k];
			
	  end			//end always
    end			//end for
  endgenerate
	
  
  
  
	/*    data byPassing in TU 4 and TU 8 to get rid of data dependency  ----->  */


	
	
	always @(*)	begin
		Xplus1sf2 = (X+1)<<2;
		Yplus1sf2 = (Y+1)<<2;
		cLastBut2 = (order==6 || tuSize==2  || (tuSize==3 && order==2));
		cLastBut3 = (order==5 || tuSize==2  || (tuSize==3 && order==1));
		nPB = 1<<tuSize;
		nMaxCU = (1<<nMaxCUlog2);
		y_bar = yTb%nMaxCU+Yplus1sf2;
		x_bar = xTb%nMaxCU+Xplus1sf2;
		y_PB_bot = yTb%nMaxCU + nPB;
		x_PB_right = xTb%nMaxCU + nPB;
		

	end
	
	
/*<--------  write to specific registers*/
	always @(posedge clk or negedge arst_n)	begin
	
		if(~arst_n)	begin
			r_tl_4 <=0;
			r_tl_4_cr <=0;
			r_t_tmp <=0;
			r_l_tmp <= 0;
			r_b_rt_tmp <= 0;
			r_br01_tmp <= 0;
			r_br01_4 <= 0;
			r_br01_8 <= 0;
			r_br01_16 <= 0;
			r_br01_32 <= 0;
			r_br01_64 <= 0;
			r_br2_8 <= 0;
			r_br2_16 <= 0;
			r_br2_32 <= 0;		
			r_rt <= 0;
			r_b <= 0;
			r_t <= 0;
			r_l <= 0;
			
			r_t_tmp_cr <=0;
			r_l_tmp_cr <= 0;
			r_b_rt_tmp_cr <= 0;
			r_br01_tmp_cr <= 0;
			r_br01_4_cr <= 0;
			r_br01_8_cr <= 0;
			r_br01_16_cr <= 0;
			r_br01_32_cr <= 0;
			r_br2_8_cr <= 0;
			r_br2_16_cr <= 0;
			r_br2_32_cr <= 0;	
			r_rt_cr <= 0;
			r_b_cr <= 0;
			r_t_cr <= 0;
			r_l_cr <= 0;

		end
		else if(~rst_n) begin
			r_tl_4 <=0;
			r_tl_4_cr <=0;
			r_t_tmp <=0;
			r_l_tmp <= 0;
			r_b_rt_tmp <= 0;
			r_br01_tmp <= 0;
			r_br01_4 <= 0;
			r_br01_8 <= 0;
			r_br01_16 <= 0;
			r_br01_32 <= 0;
			r_br01_64 <= 0;
			r_br2_8 <= 0;
			r_br2_16 <= 0;
			r_br2_32 <= 0;
			r_rt <= 0;
			r_b <= 0;
			r_t <= 0;
			r_l <= 0;

			r_t_tmp_cr <=0;
			r_l_tmp_cr <= 0;
			r_b_rt_tmp_cr <= 0;
			r_br01_tmp_cr <= 0;
			r_br01_4_cr <= 0;
			r_br01_8_cr <= 0;
			r_br01_16_cr <= 0;
			r_br01_32_cr <= 0;
			r_br2_8_cr <= 0;
			r_br2_16_cr <= 0;
			r_br2_32_cr <= 0;	
			r_rt_cr <= 0;
			r_b_cr <= 0;
			r_t_cr <= 0;
			r_l_cr <= 0;		


		end
		else 	begin
		
		
		
		if (!bStop)	begin
			if(cIdx!=2 && isCalStage)	begin
				if( (Xplus1sf2 == nPB && X==Y && tuSize!=2) || (tuSize==2 && ((cIdx==0 && partIdx==0 ) || (cIdx==1))))//(partIdx[0]^partIdx[1])==0)
					r_tl_4 <= recon[3][3];
				
				if( Xplus1sf2 == nPB  && (yTb%(1<<nMaxCUlog2))==0 && Y==0)		//top right 4x4 block in each PU
					r_t_tmp <= recon[0][3];	
				if( Yplus1sf2 == nPB  && isLtBorder && X==0)			//bottom left 4x4 block in each PU
					r_l_tmp <= recon[3][0];	
				if(Yplus1sf2 == nPB && ((isBtBorder && posBtBorderIn4 == y4InMaxCb+(nPB>>2)) || (isRtBorder && posRtBorderIn4 == x4InMaxCb+(nPB>>2))) && Y==X )
					r_b_rt_tmp <= recon[3][3];	
				if(Y==X && Yplus1sf2 == nPB)
					if(partIdx[1] == 0 )
						r_br01_tmp <= recon[3][3];
					else if (partIdx == 2)
						case (tuSize)
							3'd3: begin r_br2_8 <= recon[3][3];	end
							3'd4: begin r_br2_16 <= recon[3][3];	end
							3'd5: begin r_br2_32 <= recon[3][3];	end
						endcase
					else if(partIdx==3) begin
						r_br01_tmp <= recon[3][3];
						case (tuSize)
							3'd2: begin 
								if(x_bar[2:0]==0 &&  y_bar[3:0] ==0 && y_bar[3] ==0 &&  x_bar[3] ==1) 
									r_br2_8 <= recon[3][3];
								if(x_bar[3:0]==0 &&  y_bar[4:0] ==0 && y_bar[4] ==0 &&  x_bar[4] ==1) 
									r_br2_16 <= recon[3][3];
								if(x_bar[4:0]==0 &&  y_bar[5:0] ==0 && y_bar[5] ==0 &&  x_bar[5] ==1) 
									r_br2_32 <= recon[3][3];
								end
							3'd3: begin 
								if(x_bar[3:0]==0 &&  y_bar[4:0] ==0 && y_bar[4] ==0 &&  x_bar[4] ==1) 
									r_br2_16 <= recon[3][3];
								if(x_bar[4:0]==0 &&  y_bar[5:0] ==0 && y_bar[5] ==0 &&  x_bar[5] ==1) 
									r_br2_32 <= recon[3][3];
								end
							default: begin 
								if(x_bar[4:0]==0 &&  y_bar[5:0] ==0 && y_bar[5] ==0 &&  x_bar[5] ==1) 
									r_br2_32 <= recon[3][3];
								end
						endcase
					end
					
				if(yTb%(1<<nMaxCUlog2)==0)						//cLastBut2 = (order==6 || tuSize==2 || (tuSize==3 && order==2);
					if((cLastBut3 && X==1) || tuSize==2 || (cLastBut2 && X==1 && tuSize==3))
						r_t<= recon[0][3];
					else if(tuSize>3 && cLastBut3)
						r_t <= r_t_tmp;
				
				if(cLastBut2 && isLtBorder)		////cLastBut2 is enough, r_l is not so urgent.
					r_l <= ((tuSize>3 || (tuSize==3 && X==1) )? r_l_tmp: recon[3][0]);
				if(cLastBut3 && (isBtBorder && posBtBorderIn4 == y4InMaxCb+(nPB>>2)))	//#cLastBut3
					r_b <= ((tuSize>2)?r_b_rt_tmp: recon[3][3]);
				if(cLastBut3 && (isRtBorder && posRtBorderIn4 == x4InMaxCb+(nPB>>2)))	//#cLastBut3
					r_rt <= ((tuSize>2)?r_b_rt_tmp: recon[3][3]);
					
				if (cLastBut3)	begin			//#cLastBut3
					if(partIdx[1] == 0)
						case (tuSize)
							3'd2: begin r_br01_4 <= recon[3][3];		end
							3'd3: begin r_br01_8 <= r_br01_tmp ;		end			
							3'd4: begin r_br01_16 <= r_br01_tmp;	end
							default: r_br01_32 <= r_br01_tmp;
						endcase
					else if (partIdx == 3)
						case (tuSize)
							3'd2: begin 
								if(x_PB_right[2:0]==0 &&  y_PB_bot[2:0] ==0 && y_PB_bot[3] ==1 ) 
									r_br01_8 <= recon[3][3];
								if(x_PB_right[3:0] ==0 &&  y_PB_bot[3:0] ==0 && y_PB_bot[4] ==1 ) 
									r_br01_16 <= recon[3][3];
								if(x_PB_right[4:0]==0 &&  y_PB_bot[4:0] ==0 && y_PB_bot[5] ==1 ) 
									r_br01_32 <= recon[3][3];
								if(x_PB_right[5:0]==0 &&  y_PB_bot[5:0] ==0 && y_PB_bot[6] ==1 ) 
									r_br01_64 <= recon[3][3];
							end
							3'd3: begin 
								if(x_PB_right[3:0] ==0 &&  y_PB_bot[3:0] ==0 && y_PB_bot[4] ==1 ) 
									r_br01_16 <= r_br01_tmp;
								if(x_PB_right[4:0]==0 &&  y_PB_bot[4:0] ==0 && y_PB_bot[5] ==1 ) 
									r_br01_32 <= r_br01_tmp;
								if(x_PB_right[5:0]==0 &&  y_PB_bot[5:0] ==0 && y_PB_bot[6] ==1 ) 
									r_br01_64 <= r_br01_tmp;
									
								end
							3'd4: begin 
								if(x_PB_right[4:0]==0 &&  y_PB_bot[4:0] ==0 && y_PB_bot[5] ==1 ) 
									r_br01_32 <= r_br01_tmp;
								if(x_PB_right[5:0]==0 &&  y_PB_bot[5:0] ==0 && y_PB_bot[6] ==1 ) 
									r_br01_64 <= r_br01_tmp;
									
								end
							default: begin 
								if(x_PB_right[5:0]==0 &&  y_PB_bot[5:0] ==0 && y_PB_bot[6] ==1 ) 
									r_br01_64 <= r_br01_tmp;
							end
						endcase
				end
			end
			
			if(cIdx==2 && isCalStage)	begin
				if( (Xplus1sf2 == nPB && X==Y ) || tuSize==2)
					r_tl_4_cr <=recon[3][3];
				if( Xplus1sf2 == nPB  && (yTb%(1<<nMaxCUlog2))==0 && Y==0)		//top right 4x4 block in each PU
					r_t_tmp_cr <= recon[0][3];	
				if( Yplus1sf2 == nPB  && isLtBorder && X==0)			//bottom left 4x4 block in each PU
					r_l_tmp_cr <= recon[3][0];	
				if(Yplus1sf2 == nPB && ((isBtBorder && posBtBorderIn4 == y4InMaxCb+(nPB>>2)) || (isRtBorder && posRtBorderIn4 == x4InMaxCb+(nPB>>2))) && Y==X )
					r_b_rt_tmp_cr <= recon[3][3];	
				if(Y==X && Yplus1sf2 == nPB)
					if(partIdx[1] == 0 )
						r_br01_tmp_cr <= recon[3][3];
					else if (partIdx == 2)
						case (tuSize)
							3'd3: begin r_br2_8_cr <= recon[3][3];	end
							3'd4: begin r_br2_16_cr <= recon[3][3];	end
							3'd5: begin r_br2_32_cr <= recon[3][3];	end
						endcase
					else if(partIdx==3) begin
						r_br01_tmp_cr <= recon[3][3];
						case (tuSize)
							3'd2: begin 
								if(x_bar[2:0]==0 &&  y_bar[3:0] ==0 && y_bar[3] ==0 &&  x_bar[3] ==1) 
									r_br2_8_cr <= recon[3][3];
								if(x_bar[3:0]==0 &&  y_bar[4:0] ==0 && y_bar[4] ==0 &&  x_bar[4] ==1) 
									r_br2_16_cr <= recon[3][3];
								if(x_bar[4:0]==0 &&  y_bar[5:0] ==0 && y_bar[5] ==0 &&  x_bar[5] ==1) 
									r_br2_32_cr <= recon[3][3];
								end
							3'd3: begin 
								if(x_bar[3:0]==0 &&  y_bar[4:0] ==0 && y_bar[4] ==0 &&  x_bar[4] ==1) 
									r_br2_16_cr <= recon[3][3];
								if(x_bar[4:0]==0 &&  y_bar[5:0] ==0 && y_bar[5] ==0 &&  x_bar[5] ==1) 
									r_br2_32_cr <= recon[3][3];
								end
							default: begin 
								if(x_bar[4:0]==0 &&  y_bar[5:0] ==0 && y_bar[5] ==0 &&  x_bar[5] ==1) 
									r_br2_32_cr <= recon[3][3];
								end
						endcase
					end
				if(cLastBut2 && (yTb%(1<<nMaxCUlog2))==0)						//cLastBut2 = (order==6 || tuSize==2 || (tuSize==3 && order==2);
					r_t_cr <= ((tuSize>3 || (tuSize==3 && X==0))? r_t_tmp_cr: recon[0][3]);
				if(cLastBut2 && isLtBorder)
					r_l_cr <= ((tuSize>3 || (tuSize==3 && X==1) )? r_l_tmp_cr: recon[3][0]);
				if(cLastBut2 && (isBtBorder && posBtBorderIn4 == y4InMaxCb+(nPB>>2)))
					r_b_cr <= ((tuSize>2)?r_b_rt_tmp_cr: recon[3][3]);
				if(cLastBut2 && (isRtBorder && posRtBorderIn4 == x4InMaxCb+(nPB>>2)))
					r_rt_cr <= ((tuSize>2)?r_b_rt_tmp_cr: recon[3][3]);
					
				if (cLastBut2)	begin	
					if(partIdx[1] == 0)
						case (tuSize)
							3'd2: begin r_br01_4_cr <= recon[3][3];		end
							3'd3: begin r_br01_8_cr <= r_br01_tmp_cr ;		end			
							3'd4: begin r_br01_16_cr <= r_br01_tmp_cr;	end
							default: r_br01_32_cr <= r_br01_tmp_cr;
						endcase
					else if (partIdx == 3)
						case (tuSize)
							3'd2: begin 
								if(x_PB_right[2:0]==0 &&  y_PB_bot[2:0] ==0 && y_PB_bot[3] ==1 ) 
									r_br01_8_cr <= recon[3][3];
								if(x_PB_right[3:0] ==0 &&  y_PB_bot[3:0] ==0 && y_PB_bot[4] ==1 ) 
									r_br01_16_cr <= recon[3][3];
								if(x_PB_right[4:0]==0 &&  y_PB_bot[4:0] ==0 && y_PB_bot[5] ==1 ) 
									r_br01_32_cr <= recon[3][3];
							end
							3'd3: begin 
								if(x_PB_right[3:0] ==0 &&  y_PB_bot[3:0] ==0 && y_PB_bot[4] ==1 ) 
									r_br01_16_cr <= r_br01_tmp_cr;
								if(x_PB_right[4:0]==0 &&  y_PB_bot[4:0] ==0 && y_PB_bot[5] ==1 ) 
									r_br01_32_cr <= r_br01_tmp_cr;
						
									
								end
							default: begin 
								if(x_PB_right[4:0]==0 &&  y_PB_bot[4:0] ==0 && y_PB_bot[5] ==1 ) 
									r_br01_32_cr <= r_br01_tmp_cr;														
								end
							
						endcase
				end
			end
		end	// end of stop
	end	//end of else
end
	/* write to specific registers    --------> */	

	
	
		
			

endmodule