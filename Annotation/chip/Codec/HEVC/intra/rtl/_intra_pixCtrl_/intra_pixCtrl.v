`timescale 1ns/1ps
module intra_pixCtrl(
  clk
  ,rst_n
  ,arst_n
  ,bStop
  ,top_left_pixel
  ,sramData
  ,o_mainRefReg		//o
  ,top_right_pixel  //o
  ,bottom_left_pixel  //o
  ,ref_pos     //i
  ,ref_flag   //i
  ,mode
  ,tuSize       //2-- 4x4 ,  3-- 8x8,  6-- 64x64
  ,X
  ,Y
  ,preStage		//i
  ,DC_xxxx_data
  ,ramIdxMapping
  ,options
  ,idx_mapped_
  ,gp_bitDepth
);
  
	input clk,rst_n,arst_n,bStop;
	input [3:0]							gp_bitDepth;


	parameter 							MAINREF_PIX = 8;		// # of pixel in mainRef
	parameter 							NSRAMCHIP = 8;   //   
	parameter					 		bitDepthY = 8;
	parameter 							SRAMDW = bitDepthY*4;
	parameter 							MAINREF_DW = bitDepthY*8;   // 8bits x 8 pixels
	parameter							isChroma=0;
	
	wire [2:0]							bdepth_8_10 =  gp_bitDepth[1]? 5: 3;
	
    wire [bitDepthY-5:0] threshold = (1<<bdepth_8_10); 

	input [2:0] 					X,Y;
	input [bitDepthY-1:0] 			top_left_pixel;
	input [47:0] 					ref_pos;
	input [15:0] 					ref_flag;
	output reg [MAINREF_DW-1:0] 	o_mainRefReg;   //8bits per pixel, and 8 pixels
	input [SRAMDW*8-1:0] 			sramData;			//8bit x 4
	input [5:0] 					mode;
	input [2:0] 					tuSize;
	input [3:0] 					preStage;
	input [3*NSRAMCHIP-1:0]  		ramIdxMapping;
	input [53:0]					options;
	input [3*24-1:0]				idx_mapped_;
	reg 							isBuf,isBuf1;
	reg 							refFilter;      //1 : have filter,   0: no Filter
	reg [1:0] 						midLtRt_opt[7:0];
	reg   [2:0] 					bottomL_opt,topR_opt,DC_opt;
	reg [bitDepthY-1:0]   			topR_3_Y,topR_3_C,topR_2,bottomL_3_Y,bottomL_3_C,bottomL_2;
	reg [7:0]	 					pos_neq_maxIdx_buf1, pos_neq_maxIdx_buf;
	reg			 					n_isBuf_refFilter,n_isBuf1_refFilter;
	reg								tuSize3or2;
	reg [7:0]						n_tl_n_63;
	always @(*)	begin
		{isBuf,isBuf1,refFilter,
		midLtRt_opt[0],midLtRt_opt[1],midLtRt_opt[2],midLtRt_opt[3]
		,midLtRt_opt[4],midLtRt_opt[5],midLtRt_opt[6],midLtRt_opt[7]
		,topR_opt,bottomL_opt,DC_opt
		,n_isBuf_refFilter,n_isBuf1_refFilter,pos_neq_maxIdx_buf,pos_neq_maxIdx_buf1
		,n_tl_n_63} = options;
	end
	
	reg [1:0]			opt_filter1[7:0],opt_filter2[7:0];

	reg [SRAMDW-1:0] 	sramChip [NSRAMCHIP-1:0];
	reg [bitDepthY-1:0] temp_ref [7:0];
	reg [bitDepthY-1:0] refm [7:0];
	reg [bitDepthY-1:0] refm_biLinear [7:0];
	reg [bitDepthY-1:0] refm_121FIR [7:0];
	reg [bitDepthY-1:0] pixel[7:0][3:0];
	reg [bitDepthY-1:0] corner[7:0];  // for top_pixel_63 or left_pixel_63;
	reg [bitDepthY-1:0] pixTemp [3:0];
	reg [5:0] pos [7:0];
	reg [1:0] flag [7:0];   //0 top,  1 left, 2 top_left 
	reg [1:0] pixIdx [7:0];

	reg [1:0] pixIdx_left [7:0];
	reg [1:0] pixIdx_right [7:0];

	reg [bitDepthY-1:0] pixTempL [7:0];
	reg [bitDepthY-1:0] pixTempM [7:0];
	reg [bitDepthY-1:0] pixTempR [7:0];

	reg [2:0] 		  idx_mapping[7:0];

	reg [2:0]			  idx_mapped[7:0],idx_mapped_lt[7:0],idx_mapped_rt[7:0];
	
	always@(*)	begin
		{idx_mapped[0],idx_mapped[1],idx_mapped[2],idx_mapped[3],
		idx_mapped[4],idx_mapped[5],idx_mapped[6],idx_mapped[7],
		idx_mapped_lt[0],idx_mapped_lt[1],idx_mapped_lt[2],idx_mapped_lt[3],
		idx_mapped_lt[4],idx_mapped_lt[5],idx_mapped_lt[6],idx_mapped_lt[7],
		idx_mapped_rt[0],idx_mapped_rt[1],idx_mapped_rt[2],idx_mapped_rt[3],
		idx_mapped_rt[4],idx_mapped_rt[5],idx_mapped_rt[6],idx_mapped_rt[7]} = idx_mapped_;
							end

	reg [bitDepthY-1:0] top_pixel_31, left_pixel_31,top_pixel_63,left_pixel_63;

	output 	reg [bitDepthY-1:0] top_right_pixel,bottom_left_pixel;   //only for planar mode-   //not registers
			reg [bitDepthY-1:0] top_right_pixel_,bottom_left_pixel_;   //register
   
    output		[(bitDepthY+3)*2-1:0]		DC_xxxx_data;
  
  
	reg isBiLinearFil;    //1 : use biLinearFiltering
	reg isBiLinearLeft,isBiLinearAbove;

	reg [bitDepthY-1:0] buffer[3:0];			//in 64x64: used for buffering for some cases and some modes
											//in 32x32 : buffer and buffer_1 are used in planar mode for storing the smoothed or unsmoothed samples of ab 28-31
											//in 16x16 : buffer and buffer_1 are used in planar mode for storing the smoothed or unsmoothed samples of ab 13-15
	reg [bitDepthY-1:0] buffer_1[3:0];

	/*  <-- For calculating the unFilDC value in the preStage */
	reg [bitDepthY-1:0] DC_x[15:0],DC_x_[15:0];
	reg [bitDepthY:0] DC_xx[7:0];
	reg [bitDepthY+1:0] DC_xxx[3:0];
	reg [bitDepthY+2:0] DC_xxxx[1:0];

	wire x11 = (X==1 && Y==1);
	wire dc3 = (tuSize == 3'd3 && x11);
  
  
generate 
    genvar d;
    for(d=0; d<16; d=d+1) begin: xid
		always @(posedge clk or negedge arst_n) begin 
			if(!arst_n)
				DC_x_[d]<=0;
			else if(!rst_n)
				DC_x_[d]<=0;
			else begin
				case(DC_opt)
				3'd0:DC_x_[d] <= pixel[idx_mapping[d[3:2]]][d[1:0]];
				3'd1:DC_x_[d] <= pixel[idx_mapping[{1'b1,d[3:2]}]][d[1:0]]; 		
				3'd2:DC_x_[d] <= pixel[idx_mapping[d[3:2]]][d[1:0]];
				3'd3:begin
						if(d<8)
							DC_x_[d] <= pixel[idx_mapping[d[3:2]]][d[1:0]];       //0,1
						else if(d<12)
							DC_x_[d] <= pixel[idx_mapping[7]][d[1:0]];
						else 
							DC_x_[d] <= pixel[idx_mapping[6]][d[1:0]];
					end
				3'd4:begin
						if(d<4)
							DC_x_[d] <= pixel[idx_mapping[0]][d[1:0]];
						else if(d<8)
							DC_x_[d] <= pixel[idx_mapping[7]][d[1:0]];
						else 
							DC_x_[d] <= 0;
					end
				default:;
				endcase
			end
		end
	    
	
       always @(*) begin 
	
		case(DC_opt)
		3'd0:DC_x[d] = pixel[idx_mapping[d[3:2]]][d[1:0]];
		3'd1:DC_x[d] = pixel[idx_mapping[{1'b1,d[3:2]}]][d[1:0]]; 		
		3'd2:DC_x[d] = pixel[idx_mapping[d[3:2]]][d[1:0]];
		3'd3:begin
				if(d<8)
					DC_x[d] = pixel[idx_mapping[d[3:2]]][d[1:0]];       //0,1
				else if(d<12)
					DC_x[d] = pixel[idx_mapping[7]][d[1:0]];
				else 
					DC_x[d] = pixel[idx_mapping[6]][d[1:0]];
			end
		3'd4:begin
				if(d<4)
					DC_x[d] = pixel[idx_mapping[0]][d[1:0]];
				else if(d<8)
					DC_x[d] = pixel[idx_mapping[7]][d[1:0]];
				else 
					DC_x[d] = 0;
			end
		default:DC_x[d] = DC_x_[d];
		endcase
    end
	end
endgenerate

  always @(*) begin
	DC_xx[0]=DC_x[0]+DC_x[1];
	DC_xx[1]=DC_x[2]+DC_x[3];
	DC_xx[2]=DC_x[4]+DC_x[5];
	DC_xx[3]=DC_x[6]+DC_x[7];
	DC_xx[4]=DC_x[8]+DC_x[9];
	DC_xx[5]=DC_x[10]+DC_x[11];
	DC_xx[6]=DC_x[12]+DC_x[13];
	DC_xx[7]=DC_x[14]+DC_x[15];
	
	DC_xxx[0]=DC_xx[0]+DC_xx[1];
	DC_xxx[1]=DC_xx[2]+DC_xx[3];
	DC_xxx[2]=DC_xx[4]+DC_xx[5];
	DC_xxx[3]=DC_xx[6]+DC_xx[7];
	
	DC_xxxx[0]=DC_xxx[0]+DC_xxx[1];
	DC_xxxx[1]=DC_xxx[2]+DC_xxx[3];

  end

  assign DC_xxxx_data = {DC_xxxx[0],DC_xxxx[1]};

always @(posedge clk or negedge arst_n)	begin
	if(!arst_n)
		{top_right_pixel_,bottom_left_pixel_} <= 0;
	else if(!rst_n)
		{top_right_pixel_,bottom_left_pixel_} <= 0;
	else begin
		case (topR_opt)
		3'd0:top_right_pixel_ <= temp_ref[4];
		3'd1:top_right_pixel_ <= isChroma?refm[4]:refm_121FIR[4];
		3'd2:if(!isChroma)
					top_right_pixel_ <= topR_3_Y;//((pixel[idx_mapping[2]][0]<<1)+(pixel[idx_mapping[1]][3]+pixel[idx_mapping[2]][1])+2)>>2;	
				else
					top_right_pixel_ <= topR_3_C;//pixel[idx_mapping[2]][0];	
		3'd3:top_right_pixel_ <=topR_2;// pixel[idx_mapping[1]][0];
		default:;
		endcase
		
	
		case(bottomL_opt)
		3'd0:bottom_left_pixel_ <= temp_ref[4]; 
		3'd1:bottom_left_pixel_ <= isChroma?refm[2]:refm_121FIR[2]; 
		3'd2:if(!isChroma)
					bottom_left_pixel_ <= bottomL_3_Y;//((pixel[idx_mapping[5]][0]<<1)+(pixel[idx_mapping[6]][3]+pixel[idx_mapping[5]][1])+2)>>2;
				else
					bottom_left_pixel_ <= bottomL_3_C;//pixel[idx_mapping[5]][0];
		3'd3:bottom_left_pixel_ <= bottomL_2;//pixel[idx_mapping[6]][0];
		default:;
		endcase
	end
end
  
   
  
 
always @(posedge clk or negedge arst_n) begin
  
	if(~arst_n)		
		{buffer_1[0],buffer_1[1],buffer_1[2],buffer_1[3],buffer[0],buffer[1],buffer[2],buffer[3],top_pixel_63,left_pixel_63,top_pixel_31,left_pixel_31} <= 0;
	else if(~rst_n)
		{buffer_1[0],buffer_1[1],buffer_1[2],buffer_1[3],buffer[0],buffer[1],buffer[2],buffer[3],top_pixel_63,left_pixel_63,top_pixel_31,left_pixel_31} <= 0;	
	else begin
	
		if ((preStage == 4'd0 && mode!=6'd1 && tuSize == 4) || dc3) begin
			if(refFilter)	begin	//bilinear
		
				 buffer_1[0] <= refm_121FIR[0];    //12
				 buffer_1[1] <= refm_121FIR[1];    //13
				 buffer_1[2] <= refm_121FIR[2];    //14
				 buffer_1[3] <= refm_121FIR[3];    //15
			end
			else begin	// no filtering : use unsmoothed value

				 buffer_1[0] <= refm[0];    //12
				 buffer_1[1] <= refm[1];    //13
				 buffer_1[2] <= refm[2];    //14
				 buffer_1[3] <= refm[3];    //15
			end
		end
		if (preStage == 4'd3 && mode!=6'd1 && tuSize == 5) begin
			if(!isBiLinearFil && refFilter)	 begin	// [1 2 1] FIR
				 buffer_1[0] <= refm_121FIR[0];    //28
				 buffer_1[1] <= refm_121FIR[1];    //29
				 buffer_1[2] <= refm_121FIR[2];    //30
				 buffer_1[3] <= refm_121FIR[3];    //31
				end
			else if(refFilter)	begin	//bilinear
				 buffer_1[0] <= refm_biLinear[0];    //28
				 buffer_1[1] <= refm_biLinear[1];    //29
				 buffer_1[2] <= refm_biLinear[2];    //30
				 buffer_1[3] <= refm_biLinear[3];    //31
			end
			else begin	// no filtering : use unsmoothed value
				 buffer_1[0] <= refm[0];    //28
				 buffer_1[1] <= refm[1];    //29
				 buffer_1[2] <= refm[2];    //30
				 buffer_1[3] <= refm[3];    //31
			end
		end
		
		if (preStage == 4'd0 && mode!=6'd1 && tuSize == 5) begin
			top_pixel_63   <= pixel[idx_mapping[7]][3];		//###
			left_pixel_63 <= pixel[idx_mapping[0]][3];		//###
		end
		if (preStage == 4'd1 && mode!=6'd1 && tuSize == 5) begin
			top_pixel_31 <= pixel[idx_mapping[7]][3];		//###
			left_pixel_31 <= pixel[idx_mapping[0]][3];		//###
		end
		
		if (preStage == 4'd2 && mode!=6'd1 && tuSize == 5) begin
			if(!isBiLinearFil && refFilter)	 begin	// [1 2 1] FIR
				 buffer[0] <= refm_121FIR[0];    //28
				 buffer[1] <= refm_121FIR[1];    //29
				 buffer[2] <= refm_121FIR[2];    //30
				 buffer[3] <= refm_121FIR[3];    //31
				end
			else if(refFilter)	begin	//bilinear
				 buffer[0] <= refm_biLinear[0];    //28
				 buffer[1] <= refm_biLinear[1];    //29
				 buffer[2] <= refm_biLinear[2];    //30
				 buffer[3] <= refm_biLinear[3];    //31
			end
			else begin	// no filtering : use unsmoothed value
				 buffer[0] <= refm[0];    //28
				 buffer[1] <= refm[1];    //29
				 buffer[2] <= refm[2];    //30
				 buffer[3] <= refm[3];    //31
			end
		end
		if(tuSize ==5 && X==7 && mode==0 && preStage == 4'd8) begin
			buffer[0] <= temp_ref[4];
			buffer[1] <= temp_ref[5];
			buffer[2] <= temp_ref[6];
			buffer[3] <= temp_ref[7];
		end
		if(tuSize ==4 && X==3 && mode==0 && preStage == 4'd8) begin
			buffer[0] <= temp_ref[4];
			buffer[1] <= temp_ref[5];
			buffer[2] <= temp_ref[6];
			buffer[3] <= temp_ref[7];
		end
		if(tuSize ==3 && X==1 && mode==0 && preStage == 4'd8) begin
			buffer[0] <= temp_ref[4];
			buffer[1] <= temp_ref[5];
			buffer[2] <= temp_ref[6];
			buffer[3] <= temp_ref[7];
		end
	end
end
  
	wire signed [bitDepthY+1:0] top_bilinear_value = top_left_pixel + top_pixel_63 - (top_pixel_31<<1);				//[9:0]
	wire signed [bitDepthY+1:0] left_bilinear_value = top_left_pixel + left_pixel_63 - (left_pixel_31<<1);			//[9:0]
	wire [bitDepthY:0] abs_top = (top_bilinear_value[bitDepthY+1]==1'b1)?(0-top_bilinear_value):top_bilinear_value[bitDepthY:0];	//[8:0]		
	wire [bitDepthY:0] abs_left = (left_bilinear_value[bitDepthY+1]==1'b1)?(0-left_bilinear_value):left_bilinear_value[bitDepthY:0];  //[8:0]
	

	
	always @ (*) begin
  
		if (abs_top < threshold )
		  isBiLinearAbove = 1;
		else isBiLinearAbove=0;

		if (abs_left < threshold )
		  isBiLinearLeft = 1;
		else isBiLinearLeft =0;

		if(tuSize==3'd5 && isBiLinearLeft && isBiLinearAbove) 
		  isBiLinearFil = 1 ; 
			  else isBiLinearFil=0;		//bi

		topR_3_Y = ((pixel[idx_mapping[2]][0]<<1)+(pixel[idx_mapping[1]][3]+pixel[idx_mapping[2]][1])+2)>>2;
		topR_3_C = pixel[idx_mapping[2]][0];
		topR_2 = pixel[idx_mapping[1]][0];
		
		
		case (topR_opt)
		3'd0:top_right_pixel = temp_ref[4];
		3'd1:top_right_pixel = isChroma?refm[4]:refm_121FIR[4];
		3'd2:if(!isChroma)
					top_right_pixel = topR_3_Y;//((pixel[idx_mapping[2]][0]<<1)+(pixel[idx_mapping[1]][3]+pixel[idx_mapping[2]][1])+2)>>2;	
				else
					top_right_pixel = topR_3_C;//pixel[idx_mapping[2]][0];	
		3'd3:top_right_pixel =topR_2;// pixel[idx_mapping[1]][0];
		default:top_right_pixel = top_right_pixel_;
		endcase
			
		bottomL_3_Y = ((pixel[idx_mapping[5]][0]<<1)+(pixel[idx_mapping[6]][3]+pixel[idx_mapping[5]][1])+2)>>2;
		bottomL_3_C = pixel[idx_mapping[5]][0];
		bottomL_2 =  pixel[idx_mapping[6]][0];
		
		case(bottomL_opt)
		3'd0:bottom_left_pixel = temp_ref[4]; 
		3'd1:bottom_left_pixel = isChroma?refm[2]:refm_121FIR[2]; 
		3'd2:if(!isChroma)
					bottom_left_pixel = bottomL_3_Y;//((pixel[idx_mapping[5]][0]<<1)+(pixel[idx_mapping[6]][3]+pixel[idx_mapping[5]][1])+2)>>2;
				else
					bottom_left_pixel = bottomL_3_C;//pixel[idx_mapping[5]][0];
		3'd3:bottom_left_pixel = bottomL_2;//pixel[idx_mapping[6]][0];
		default:bottom_left_pixel = bottom_left_pixel_;
		endcase

	end


   
  


generate genvar i;
	for(i=0;i<NSRAMCHIP;i=i+1)begin: xi
		always @(*) begin	
			sramChip[i] = sramData[(SRAMDW*8-1-SRAMDW*i):(SRAMDW*7-SRAMDW*i)];
			idx_mapping[i]=ramIdxMapping[NSRAMCHIP*3-1-i*3:3*(NSRAMCHIP-1)-i*3];
		end
	end
endgenerate
  
    
generate genvar p;
	for(p=0;p<8;p=p+1)		begin: xp	// idx of RAM chip
		always @(*) begin	
			{pixel[p][0],pixel[p][1],pixel[p][2],pixel[p][3]} =  sramChip[p];
		end
	end
endgenerate
  
 
generate genvar t;
	for(t=0;t<MAINREF_PIX;t=t+1)begin: xt
		always @(*) begin 
			pos[t]   =  ref_pos[(47-6*t):(42-6*t)] ; 
			flag[t]  =  ref_flag[(15-2*t):(14-2*t)] ;
			pixIdx[t] = pos[t][1:0];
			pixIdx_left[t] = pixIdx[t]-1;
			pixIdx_right[t] = pixIdx[t]+1;

			
			case(flag[t])
			2'd0: 
				corner[t] = top_pixel_63;
			default:
				corner[t] = left_pixel_63;

			endcase
	 
			if(flag[t]<3'd2) 
				refm[t]=pixel[(idx_mapped[t])][(pixIdx[t])];     
			else 
				refm[t] = top_left_pixel;


	 
		//	if(flag[t]!= 3'd2 && pos[t]!= 63)
			if(n_tl_n_63[t])
				refm_biLinear[t] =   ((63-pos[t])*top_left_pixel + (pos[t]+1)*corner[t]+32)>>6 ; 
			else 
				refm_biLinear[t] = refm[t];

		
			case(midLtRt_opt[t])
			3'd0:begin
				pixTempM[t] = top_left_pixel;
				pixTempL[t] = pixel[idx_mapping[7]][0];     // left 0
				pixTempR[t] = pixel[idx_mapping[0]][0];     // above 0
			end 
			3'd1: begin
				pixTempM[t] = pixel[idx_mapping[0]][0];
				pixTempL[t] = top_left_pixel;
				pixTempR[t] = pixel[idx_mapping[0]][1];
			end 
			3'd2: begin
				pixTempM[t] = pixel[idx_mapping[7]][0];
				pixTempL[t] = pixel[idx_mapping[7]][1];
				pixTempR[t] = top_left_pixel;
			end
			default: begin
				pixTempM[t] = pixel[(idx_mapped[t])][pixIdx[t]]; 
				pixTempL[t] = pixel[(idx_mapped_lt[t])][pixIdx_left[t]];      
				pixTempR[t] = pixel[(idx_mapped_rt[t])][pixIdx_right[t]];     
			end  
			endcase
			
			refm_121FIR[t] = ((pixTempM[t]<<1)+(pixTempL[t]+pixTempR[t])+2)>>2;

		
			if(t<4)begin
				case (opt_filter1[t])
				3'd0: temp_ref[t] = buffer_1[t];
				3'd1: temp_ref[t] = refm_biLinear[t];
				3'd2: temp_ref[t] = refm_121FIR[t];//refm_biLinear[t];
				default:temp_ref[t] = refm[t];
				endcase
			end
			else begin
				case (opt_filter2[t])
				3'd0: temp_ref[t] = buffer[t-4];
				3'd1: temp_ref[t] = refm_biLinear[t];
				3'd2: temp_ref[t] = refm_121FIR[t];//refm_biLinear[t];
				default:temp_ref[t] = refm[t];
				endcase
			end
			
			o_mainRefReg[(bitDepthY*8-1-bitDepthY*t):(bitDepthY*7-bitDepthY*t)] = temp_ref[t];
		end	// end of always block
	end	// end of for 0-7
endgenerate

generate genvar z;
	for(z=0;z<8;z=z+1) begin :xz
		always@(*) begin
			opt_filter1[z] = 3;
			opt_filter2[z] = 3;
			if(isBuf1)
				opt_filter1[z] =0;
			if(n_isBuf1_refFilter && isBiLinearFil)
				opt_filter1[z] =1 ;
			if(pos_neq_maxIdx_buf1[z] && !isBiLinearFil)
				opt_filter1[z] = 2;
			
			
			if(isBuf)
				opt_filter2[z] =0;
			if(n_isBuf_refFilter && isBiLinearFil)
				opt_filter2[z] =1 ;
			if(pos_neq_maxIdx_buf[z] && !isBiLinearFil)
				opt_filter2[z] = 2 ;
		end
	end
endgenerate
	
endmodule